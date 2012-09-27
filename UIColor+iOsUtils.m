//
//  UIColor+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 27.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UIColor+iOsUtils.h"

@implementation UIColor(iOsUtils)

+(UIColor*)colorWithRGB:(int32_t)value
{
  Byte r = (value >> 16) & 255;
  Byte g = (value >> 8) & 255;
  Byte b = value & 255;

  return [UIColor colorWithRed:( r / 255. ) green:( g / 255. ) blue:( b / 255. ) alpha:1.];
}

@end
