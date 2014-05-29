//
//  ATInflector.m
//  Instabank
//
//  Created by Andrey Toropchin on 28.05.14.
//  Copyright (c) 2014 iDa Mobile. All rights reserved.
//

#import "ATInflector.h"
#import <objc/runtime.h>

#define kBaseUrl          @"http://export.yandex.ru/inflect.xml?name="
#define kDefaultsKey      @"inflections"

@interface ATInflector ()<NSXMLParserDelegate>
@property (atomic, strong) NSMutableDictionary* dict;
@end

@implementation ATInflector

+ (ATInflector*)sharedInstance
{
  static ATInflector* sharedInstance = nil;
  static dispatch_once_t once = 0;
  dispatch_once(&once, ^{sharedInstance = [[self alloc] init];});
  return sharedInstance;
}

- (id)init
{
  self = [super init];
  if (self != nil)
    self.dict = [NSMutableDictionary dictionaryWithDictionary:[[NSUserDefaults standardUserDefaults] objectForKey:kDefaultsKey]];
  return self;
}

- (NSString*)inflectionForName:(NSString*)name withCase:(kInflectionCase)infCase completion:(void (^)(NSString* result))completion
{
  if ([name length] > 0)
  {
    NSDictionary* dict = self.dict[name];
    if (dict != nil)
      return [self resultFromDict:dict withCase:infCase fallback:name];
  }
  else
    return name;

  if (completion != nil)
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
      NSString* urlStr = [kBaseUrl stringByAppendingString:name];
      urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
      NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:urlStr]];
      parser.delegate = self;
      objc_setAssociatedObject(parser, "key", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
      [parser parse];

      dispatch_async(dispatch_get_main_queue(), ^{
        completion([self resultFromDict:self.dict[name] withCase:infCase fallback:name]);
      });

      // Save for future reuse
      @synchronized(self)
      {
        if (self.dict[name] != nil)
        {
          [[NSUserDefaults standardUserDefaults] setObject:self.dict forKey:kDefaultsKey];
          [[NSUserDefaults standardUserDefaults] synchronize];
        }
      }
    });

  return name;
}

- (NSString*)resultFromDict:(NSDictionary*)dict withCase:(kInflectionCase)infCase fallback:(NSString*)string
{
  NSString* str = dict[[NSString stringWithFormat:@"%d", infCase]];
  if (str == nil)
    str = string;
  return str;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
  @synchronized(self)
  {
    NSString* key = objc_getAssociatedObject(parser, "key");
    NSMutableDictionary* dict = self.dict[key];
    if (dict == nil)
    {
      dict = [NSMutableDictionary dictionary];
      self.dict[key] = dict;
    }
    dict[[NSString stringWithFormat:@"%d", [dict count]]] = string;
  }
}

+ (NSString*)inflectionForName:(NSString*)name withCase:(kInflectionCase)infCase completion:(void (^)(NSString* result))completion
{
  return [[[self class] sharedInstance] inflectionForName:name withCase:infCase completion:completion];
}

@end
