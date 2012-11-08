//
//  TextFieldBackspaceAware.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 08.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "TextFieldBackspaceAware.h"

@implementation TextFieldBackspaceAware

-(void)deleteBackward
{
  [self.textFieldBackspaceAwareDelegate backspacePressed:self];
  [super deleteBackward];
}

@end
