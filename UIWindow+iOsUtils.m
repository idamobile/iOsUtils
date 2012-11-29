//
//  UIWindow+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 28.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UIWindow+iOsUtils.h"

@implementation UIWindow(iOsUtils)

-(UIImage*)makeSnapshot
{
  CGRect screenRect = self.bounds;
  
  UIGraphicsBeginImageContextWithOptions(screenRect.size, YES, [UIScreen mainScreen].scale);
  
  CGContextRef ctx = UIGraphicsGetCurrentContext();
  [[UIColor blackColor] set];
  CGContextFillRect(ctx, screenRect);
  [self.layer renderInContext:ctx];
  
  UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
  
  UIGraphicsEndImageContext();
  
  return image;
}

@end
