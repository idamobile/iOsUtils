//
//  NSFileManager+iOsUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 24.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@interface NSFileManager(iOsUtils)

+(BOOL)createFolder:(NSString*)path;

// Get the caches directory, create if not exists.
+(NSString*)cachesDirectory;

@end
