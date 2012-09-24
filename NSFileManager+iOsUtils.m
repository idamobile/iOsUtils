//
//  NSFileManager+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 24.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "NSFileManager+iOsUtils.h"

@implementation NSFileManager(iOsUtils)

+(BOOL)createFolder:(NSString*)path
{
  NSFileManager *fileManager = [NSFileManager defaultManager];
  BOOL isDir = NO;
  NSError *error = nil;;
  if( [fileManager fileExistsAtPath:path isDirectory:&isDir] ) {
    if( isDir ) {
      return NO;
    }
    [fileManager removeItemAtPath:path error:nil];
  }
  return [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
}

+(NSString*)cachesDirectory
{
	NSString* res = [NSSearchPathForDirectoriesInDomains( NSCachesDirectory, NSUserDomainMask, YES ) lastObject];
	[self createFolder:res];
	return res;
}

@end
