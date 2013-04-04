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
    completion();
  } else {
    [self dismissViewControllerAnimated:flag completion:completion];
  }
}

-(void)dismissSelfAnimated:(BOOL)flag
{
  if( self.navigationController && (self.navigationController.topViewController == self || self.navigationController.topViewController == self.parentViewController) ) {
    if( self.navigationController.viewControllers.count == 1 ) {
      [self.navigationController dismissSelfAnimated:flag];
    } else {
      [self.navigationController popViewControllerAnimated:flag];
    }
  } else if( self.presentingViewController && self.presentingViewController.presentedViewController == self ) {
    [self.presentingViewController dismissViewControllerAnimated:flag completion:^{}];
  }
}

-(void)dismissSelfAnimated
{
  [self dismissSelfAnimated:YES];
}

-(void)displayError:(NSError*)error
{
	if( !error ) {
		return;
	}
	[self displayErrorString:[error localizedDescription]];
}

-(void)displayErrorString:(NSString*)string
{
	if( string.length == 0 ) {
		return;
	}
  [[[UIAlertView alloc] initWithTitle:@"Error"
                              message:string
                             delegate:nil
                    cancelButtonTitle:@"OK"
                    otherButtonTitles:nil] show];
}

@end
