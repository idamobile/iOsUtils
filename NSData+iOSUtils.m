//
// Created by Aleksey Kozhevnikov on 24.07.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import "NSData+iOSUtils.h"

@implementation NSData(iOSUtils)

-(NSString*)SHA256
{
  const char *cStr = [self bytes];
  unsigned char result[CC_SHA256_DIGEST_LENGTH];
  CC_SHA256(cStr, strlen(cStr), result);
  NSMutableString* s = [NSMutableString stringWithCapacity:2 * CC_SHA256_DIGEST_LENGTH];
  for( int i = 0; i < CC_SHA256_DIGEST_LENGTH; ++i ) {
    [s appendFormat:@"%02X", result[i]];
  }
  return [s uppercaseString];
}

@end
