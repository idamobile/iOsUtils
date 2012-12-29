//
//  DraggableKeyboardVC.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 10.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "DraggableKeyboardVC.h"
#import "UIView+iOsUtils.h"

@interface DraggableKeyboardVC()

@property(nonatomic, assign) CGRect keyboardSuperFrame;
@property(nonatomic, weak) UIView* keyboardSuperView;
@property(nonatomic, assign) BOOL keyboardIsMoving;

@end

@implementation DraggableKeyboardVC

+(void)addDummyInputAccessoryView:(id)textFieldOrView
{
  if( [textFieldOrView isKindOfClass:[UITextField class]] || [textFieldOrView isKindOfClass:[UITextView class]] ) {
    if( ![textFieldOrView inputAccessoryView] ) {
      UIView* accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
      accessoryView.backgroundColor = [UIColor clearColor];
      [(id)textFieldOrView setInputAccessoryView:accessoryView];
    }
  }
}

-(void)setIsDraggingDisabled:(BOOL)isDraggingDisabled
{
  NSAssert(!self.keyboardIsMoving, @"Property should not be changed while keyboard is dragging");
  _isDraggingDisabled = isDraggingDisabled;
}

-(CGRect)openedKeyboardRect
{
  return self.keyboardSuperFrame;
}

-(void)viewDidLoad
{
  [super viewDidLoad];
  self.draggingKeyboardPanGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
  self.draggingKeyboardPanGestureRecognizer.cancelsTouchesInView = NO;
  [self.view addGestureRecognizer:self.draggingKeyboardPanGestureRecognizer];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardWillShowNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardDidShow:)
                                               name:UIKeyboardDidShowNotification
                                             object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
}

-(void)viewDidUnload
{
  self.draggingKeyboardPanGestureRecognizer = nil;
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
  self.keyboardSuperView.hidden = NO;
  [super viewDidUnload];
}

-(void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  self.keyboardSuperView.hidden = NO;
  self.draggingKeyboardPanGestureRecognizer = nil;
}

#pragma mark - Keyboard Notifications

-(void)keyboardWillShow:(NSNotification*)notification
{
  self.keyboardSuperView.hidden = NO;
}

-(void)keyboardWillHide:(NSNotification*)notification
{
}

-(void)keyboardDidShow:(NSNotification*)notification
{
  UIResponder* firstResponder = [self.view findFirstResponderRecursively];
  if( firstResponder ) {
    self.keyboardSuperView = firstResponder.inputAccessoryView.superview;
    self.keyboardSuperFrame = self.keyboardSuperView.frame;
  }
}

#pragma mark - UIPanGestureRecognizer

-(void)panGesture:(UIPanGestureRecognizer*)gestureRecognizer
{
  if( !self.keyboardSuperView.superview || self.isDraggingDisabled ) {
    return;
  }
  if( gestureRecognizer.state == UIGestureRecognizerStateEnded && self.keyboardIsMoving ) {
    const CGFloat keyboardShift = self.keyboardSuperView.y - self.keyboardSuperFrame.origin.y;
    if( keyboardShift > (self.keyboardSuperFrame.size.height / 3.) ) {
      [self hideDisplacedKeyboard];
    } else {
      [self bringBackDisplacedKeyboard];
    }
    self.keyboardIsMoving = NO;
  } else {
    CGFloat yLocationInKeyboard = [gestureRecognizer locationInView:self.keyboardSuperView].y;
    CGFloat newKeyboardY = MAX(self.keyboardSuperFrame.origin.y, self.keyboardSuperView.y + yLocationInKeyboard);
    newKeyboardY = MIN(self.keyboardSuperFrame.origin.y + self.keyboardSuperFrame.size.height, newKeyboardY);
    CGFloat shift = (newKeyboardY - self.keyboardSuperView.y);
    if( (newKeyboardY > self.keyboardSuperFrame.origin.y) && !self.keyboardIsMoving ) {
      self.keyboardIsMoving = YES;
      [self didShiftKeyboardViewBegin];
    }
    if( self.keyboardIsMoving && (shift != 0) ) {
      self.keyboardSuperView.y += shift;
      [self didShiftKeyboardViewContinue:shift];
    }
  }
}

-(void)hideDisplacedKeyboard
{
  CGFloat animationDuration = 0.2;
  [self willHideDisplacedKeyboardAnimatedWithDuration:animationDuration];
  [UIView animateWithDuration:animationDuration
                   animations:^
  {
    self.keyboardSuperView.y = [UIScreen mainScreen].bounds.size.height;
  }
                   completion:^(BOOL finished)
  {
    self.keyboardSuperView.hidden = YES;
    self.keyboardSuperView.frame = self.keyboardSuperFrame;
    [self.view resignFirstResponderRecursively];
  }];
}

-(void)willHideDisplacedKeyboardAnimatedWithDuration:(CGFloat)animationDuration
{
}

-(void)bringBackDisplacedKeyboard
{
  CGFloat animationDuration = 0.2;
  [self willBringBackDisplacedKeyboard:animationDuration];
  [UIView animateWithDuration:animationDuration
                   animations:^
  {
    self.keyboardSuperView.frame = self.keyboardSuperFrame;
  }
                  completion:^(BOOL finished)
  {
  }];
}

-(void)willBringBackDisplacedKeyboard:(CGFloat)animationDuration
{
}

-(void)didShiftKeyboardViewBegin
{
}

-(void)didShiftKeyboardViewContinue:(CGFloat)shift
{
}

#pragma mark -

@end
