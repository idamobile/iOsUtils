//
//  UITextViewWithPlaceholder.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 22.02.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

@interface UITextViewWithPlaceholder : UITextView

@property(nonatomic, copy) NSString* placeholderText;
@property(nonatomic, strong) UIColor* placeholderColor;
@property(nonatomic, strong) UIFont* placeholderFont;

@end
