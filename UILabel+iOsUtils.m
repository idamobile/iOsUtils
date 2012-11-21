//
//  UILabel+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 19.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UILabel+iOsUtils.h"
#import "UIView+iOsUtils.h"

@implementation UILabel(iOsUtils)

-(void)heightToFit
{
  self.height = [self sizeThatFits:self.bounds.size].height;
}

@end
