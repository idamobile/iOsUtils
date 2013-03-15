//
//  MKMapView+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 15.03.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "MKMapView+iOsUtils.h"

@implementation MKMapView(iOsUtils)

-(void)relocateCopyrightLogoForVisibleRect:(CGRect)rect
{
  for( UIView* subview in self.subviews ) {
    if( [subview isKindOfClass:[UILabel class]] ) {
      // Apple logo
      CGRect newFrame = subview.frame;
      newFrame.origin.x = rect.origin.x + 11;
      newFrame.origin.y = CGRectGetMaxY(rect) - 20;
      subview.frame = newFrame;
      return;
    }
    if( [subview isKindOfClass:[UIImageView class]] ) {
      // Google logo
      CGRect newFrame = subview.frame;
      newFrame.origin.x = rect.origin.x + 9;
      newFrame.origin.y = CGRectGetMaxY(rect) - 27;
      subview.frame = newFrame;
      return;
    }
  }
}

@end
