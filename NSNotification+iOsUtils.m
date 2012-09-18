//
//  NSNotification+iOsUtils.m
//  iOsUtils
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

#import "NSNotification+iOsUtils.h"

@implementation NSNotificationCenter (iOsUtils)

+(void)addKeyboardObserver:(NSObject<KeyboardObserverDelegate>*)delegate
{
	NSNotificationCenter* nc = [ NSNotificationCenter defaultCenter ];
  if( [delegate respondsToSelector:@selector( keyboardWillShow: )] ) {
    [nc addObserver:delegate
           selector:@selector( keyboardWillShow: )
               name:UIKeyboardWillShowNotification
             object:nil];
  }
  if( [delegate respondsToSelector:@selector( keyboardDidShow: )] ) {
    [nc addObserver:delegate
           selector:@selector( keyboardDidShow: )
               name:UIKeyboardDidShowNotification
             object:nil];
  }
  if( [delegate respondsToSelector:@selector( keyboardWillHide: )] ) {
    [nc addObserver:delegate
           selector:@selector( keyboardWillHide: )
               name:UIKeyboardWillHideNotification
             object:nil];
  }
}

+(void)removeKeyboardObserver:(NSObject<KeyboardObserverDelegate>*)delegate
{
	NSNotificationCenter* nc = [ NSNotificationCenter defaultCenter ];
	if( [ delegate respondsToSelector:@selector( keyboardWillShow: ) ] )
		[ nc removeObserver:delegate name:UIKeyboardWillShowNotification object:nil ];
	if( [ delegate respondsToSelector:@selector( keyboardDidShow: ) ] )
		[ nc removeObserver:delegate name:UIKeyboardDidShowNotification object:nil ];
	if( [ delegate respondsToSelector:@selector( keyboardWillHide: ) ] )
		[ nc removeObserver:delegate name:UIKeyboardWillHideNotification object:nil ];
}

@end

@implementation NSNotification (iOsUtils)

// http://stackoverflow.com/a/1436931/126995
-(NSTimeInterval)keyboardAnimationDuration
{
    NSDictionary* info = [ self userInfo ];
    NSValue* value = [ info objectForKey:UIKeyboardAnimationDurationUserInfoKey ];
    NSTimeInterval duration = 0;
    [ value getValue:&duration ];
    return duration;
}

-(CGSize)keyboardSize
{
  NSDictionary* info = [ self userInfo ];
  id obj = [ info objectForKey:UIKeyboardFrameBeginUserInfoKey ];
  if( !obj )
    return CGSizeZero;
  CGRect rc = [ obj CGRectValue ];
  return rc.size;
}

@end
