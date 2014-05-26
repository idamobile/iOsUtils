//
//  ATAlertView.m
//  Instabank
//
//  Created by Andrey Toropchin on 26.05.14.
//  Copyright (c) 2014 iDa Mobile. All rights reserved.
//

#import "ATAlertView.h"

@implementation ATAlertView

- (void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)show
{
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismiss:) name:UIApplicationWillResignActiveNotification object:nil];
  [super show];
}

- (void)dismiss:(NSNotification*)notification
{
  [self dismissWithClickedButtonIndex:[self cancelButtonIndex] animated:NO];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
