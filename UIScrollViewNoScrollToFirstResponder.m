//
// Created by Aleksey Kozhevnikov on 26.04.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "UIScrollViewNoScrollToFirstResponder.h"

@implementation UIScrollViewNoScrollToFirstResponder

-(void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated
{
  return;
}

@end