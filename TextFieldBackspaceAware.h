//
//  TextFieldBackspaceAware.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 08.11.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@class TextFieldBackspaceAware;

@protocol TextFieldBackspaceAwareDelegate<NSObject>

// Called before backspace is handled
-(void)backspacePressed:(TextFieldBackspaceAware*)textFieldBackspaceAware;

@end

@interface TextFieldBackspaceAware : UITextField

@property(nonatomic, weak) IBOutlet id<TextFieldBackspaceAwareDelegate> textFieldBackspaceAwareDelegate;

@end
