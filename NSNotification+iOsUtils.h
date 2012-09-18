//
//  NSNotification+iOsUtils.h
//  iOsUtils
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

@protocol KeyboardObserverDelegate
@optional
-(void)keyboardWillShow:(NSNotification*)notification;
-(void)keyboardDidShow:(NSNotification*)notification;
-(void)keyboardWillHide:(NSNotification*)notification;
@end

@interface NSNotificationCenter (iOsUtils)
+(void)addKeyboardObserver:(NSObject<KeyboardObserverDelegate>*)delegate;
+(void)removeKeyboardObserver:(NSObject<KeyboardObserverDelegate>*)delegate;
@end

@interface NSNotification (iOsUtils)
-(NSTimeInterval)keyboardAnimationDuration;
-(CGSize)keyboardSize;
@end
