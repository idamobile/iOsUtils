//
//  ScrollViewAutoresize.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 25.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "ScrollViewAutoresize.h"
#import "NSNotification+iOsUtils.h"
#import "UIView+iOsUtils.h"

@interface ScrollViewAutoresize () <KeyboardObserverDelegate>

@property(nonatomic, assign) CGFloat heightNoKeyboard;

@end

@implementation ScrollViewAutoresize

@synthesize heightNoKeyboard;

-(void)awakeFromNib
{
  [NSNotificationCenter addKeyboardObserver:self];
}

-(void)dealloc
{
  [NSNotificationCenter removeKeyboardObserver:self];
}

-(void)keyboardDidShow:(NSNotification*)notification
{
  if( !self.heightNoKeyboard ) {
    self.heightNoKeyboard = self.height;
  }
  CGRect keyboardFrame;
  [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardFrame];
  keyboardFrame = [self.window convertRect:keyboardFrame toView:self.superview];
  self.height = MIN(self.heightNoKeyboard, CGRectGetMinY(keyboardFrame) - CGRectGetMinY(self.frame));
}

-(void)keyboardWillHide:(NSNotification*)notification
{
  if( self.heightNoKeyboard ) {
    self.height = self.heightNoKeyboard;
    self.heightNoKeyboard = 0;
  }
}

@end
