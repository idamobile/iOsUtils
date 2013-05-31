//
//  UITextFieldCustomPlaceholder.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 22.02.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

@interface UITextFieldCustomPlaceholder : UITextField

+(UIColor*)defaultPlaceholderColor;

@property(nonatomic, strong) UIColor* placeholderColor;
@property(nonatomic, strong) UIFont* placeholderFont;

@end
