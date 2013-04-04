//
//  NSArray+iOSUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 04.04.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "NSArray+iOSUtils.h"

@implementation NSArray(iOSUtils)

-(id)firstObject
{
	if( self.count == 0) {
    return nil;
	}
	return [self objectAtIndex:0];
}

@end
