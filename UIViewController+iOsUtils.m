//
//  UIViewController+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 02.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UIViewController+iOsUtils.h"

@implementation UIViewController(iOsUtils)

-(void)dismissPresentedViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
  if( !self.presentedViewController ) {
    if( completion ) {
      completion();
    }
  } else {
    [self dismissViewControllerAnimated:flag completion:completion];
  }
}

-(void)dismissSelfAnimated:(BOOL)flag
{
  NSUInteger indexOfSelf = NSNotFound;
  UIViewController* previousVC = nil;
  if( self.navigationController ) {
    NSArray* viewControllers = self.navigationController.viewControllers;
    indexOfSelf = [viewControllers indexOfObject:self];
    if( indexOfSelf != NSNotFound && indexOfSelf > 0 ) {
      previousVC = viewControllers[indexOfSelf - 1];
    }
  }
  if( self.navigationController && indexOfSelf != NSNotFound ) {
    if( !previousVC ) {
      [self.navigationController dismissSelfAnimated:flag];
    } else {
      [self.navigationController popToViewController:previousVC animated:YES];
    }
  } else if( self.presentingViewController && self.presentingViewController.presentedViewController == self ) {
    [self.presentingViewController dismissViewControllerAnimated:flag completion:^{}];
  }
}

-(void)dismissSelfAnimated
{
  [self dismissSelfAnimated:YES];
}

-(UIViewController*)presentationHierarchyTopSuccessor
{
  if( self.navigationController && self.navigationController.viewControllers.count > 0 ) {
    return [[self.navigationController topViewController] presentationHierarchyTopSuccessor];
  } else if( self.presentedViewController ) {
    return [self.presentedViewController presentationHierarchyTopSuccessor];
  } else {
    return self;
  }
}

@end
