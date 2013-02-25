//
//  DraggableKeyboardVC.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 10.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@interface DraggableKeyboardVC : UIViewController

+(void)addDummyInputAccessoryView:(id)textFieldOrView;

// Should not be changed while keyboard is dragging
@property(nonatomic, assign) BOOL isDraggingDisabled;
@property(nonatomic, strong) UIPanGestureRecognizer* draggingKeyboardPanGestureRecognizer;

// Keyboard notifications handlers, always call super on override
-(void)keyboardWillShow:(NSNotification*)notification;
-(void)keyboardWillHide:(NSNotification*)notification;
-(void)keyboardDidShow:(NSNotification*)notification;

-(CGRect)openedKeyboardRect;

// Override it

-(void)willHideDisplacedKeyboardAnimatedWithDuration:(CGFloat)animationDuration;
// Called inside animation block, put here your custom animations
-(void)hideDisplacedKeyboardAnimation:(CGFloat)animationDuration;
// Called inside completion block of animation block
-(void)didHideDisplacedKeyboard;

-(void)willBringBackDisplacedKeyboard:(CGFloat)animationDuration;
// Called inside animation block, put here your custom animations
-(void)bringBackDisplacedKeyboardAnimation:(CGFloat)animationDuration;
// Called inside completion block of animation block
-(void)didBringBackDisplacedKeyboard;

-(void)didShiftKeyboardViewBegin;
-(void)didShiftKeyboardViewContinue:(CGFloat)shift;

@end
