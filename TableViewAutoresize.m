//
//  TableViewAutoresize.m
//  Home Credit
//
//  Created by Aleksey Kozhevnikov on 06.06.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "TableViewAutoresize.h"
#import "NSNotification+iOsUtils.h"
#import "UIView+iOsUtils.h"

@interface TableViewAutoresize () <KeyboardObserverDelegate>

@property(nonatomic, assign) CGFloat heightNoKeyboard;

@end

@implementation TableViewAutoresize

@synthesize heightNoKeyboard, autoresizeDelegate;

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
  // If converting to self gives strange results for table with scroll, so superview.
  keyboardFrame = [self.window convertRect:keyboardFrame toView:self.superview];
  self.height = MIN( self.heightNoKeyboard, CGRectGetMinY( keyboardFrame ) - CGRectGetMinY( self.frame ) );
  // Scroll if needed
  if( [self.autoresizeDelegate respondsToSelector:@selector(scrollingPathIn:)] ) {
      NSIndexPath* scrollingPath = [self.autoresizeDelegate scrollingPathIn:self];
      if( scrollingPath ) {
          [self scrollToRowAtIndexPath:scrollingPath
                      atScrollPosition:UITableViewScrollPositionTop
                              animated:YES];
      }
  }
}

-(void)keyboardWillHide:(NSNotification*)notification
{
  if( self.heightNoKeyboard ) {
    self.height = self.heightNoKeyboard;
    self.heightNoKeyboard = 0;
  }
}

@end
