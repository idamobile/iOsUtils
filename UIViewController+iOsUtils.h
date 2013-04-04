//
//  UIViewController+iOsUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 02.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@interface UIViewController(iOsUtils)

// If self controller has no presented view controller calls completion block instantly,
// else the behaviour is the same as dismissViewControllerAnimated:completion:
-(void)dismissPresentedViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;

// Work for navigation controllers and when modally presented
-(void)dismissSelfAnimated:(BOOL)flag;
-(void)dismissSelfAnimated;

-(void)displayError:(NSError*)error;
-(void)displayErrorString:(NSString*)string;

@end
