//
// Created by Aleksey Kozhevnikov on 21.05.13.
// Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "UITextFieldNoPaste.h"

@implementation UITextFieldNoPaste

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
  if( action == @selector(paste:) ) {
    return NO;
  }
  return [super canPerformAction:action withSender:sender];
}

@end
