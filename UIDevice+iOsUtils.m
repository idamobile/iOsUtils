//
//  UIDevice+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 15.10.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@implementation UIDevice(iOsUtils)

+(BOOL)isPad
{
  return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(BOOL)isPhone
{
  return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

@end
