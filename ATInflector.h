//
//  ATInflector.h
//  Instabank
//
//  Created by Andrey Toropchin on 28.05.14.
//  Copyright (c) 2014 iDa Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
  kInflectionCaseNominative = 1,
  kInflectionCaseGenitive,
  kInflectionCaseDative,
  kInflectionCaseAccusative,
  kInflectionCaseInstrumental,
  kInflectionCasePrepositional
} kInflectionCase;

@interface ATInflector : NSObject
// Return inflection immediately if cached, otherwise result will be in completion handler
+ (NSString*)inflectionForName:(NSString*)name withCase:(kInflectionCase)infCase completion:(void (^)(NSString* result))completion;
@end
