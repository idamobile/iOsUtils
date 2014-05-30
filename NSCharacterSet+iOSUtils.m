//
// Created by Aleksey Kozhevnikov on 14.08.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "NSCharacterSet+iOSUtils.h"

@implementation NSCharacterSet(iOSUtils)

+(NSCharacterSet*)latinLettersCharacterSet
{
  NSMutableCharacterSet* result = [NSMutableCharacterSet new];
  [result addCharactersInRange:NSMakeRange('a', 'z' - 'a' + 1)];
  [result addCharactersInRange:NSMakeRange('A', 'Z' - 'A' + 1)];
  return result;
}

@end
