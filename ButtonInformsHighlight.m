//
//  ButtonInformsHighlight.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 13.03.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "ButtonInformsHighlight.h"

@implementation ButtonInformsHighlight

-(void)setHighlighted:(BOOL)highlighted
{
  [self.delegate button:self highlightChanged:highlighted];
  [super setHighlighted:highlighted];
}

@end
