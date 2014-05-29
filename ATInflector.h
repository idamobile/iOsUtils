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
  kInflectionCaseAccusative,
  kInflectionCaseDative,
  kInflectionCaseInstrumental,
  kInflectionCasePrepositional
} kInflectionCase;

@interface ATInflector : NSObject
+ (NSString*)inflectionForName:(NSString*)name withCase:(kInflectionCase)infCase completion:(void (^)(NSString* result))completion;
@end
