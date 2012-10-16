//
//  CustomFonts.h
//  UBRD
//
//  Created by Aleksey Kozhevnikov on 23.08.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@interface CustomFonts : NSObject

// Initialization methods:

+(void)setSizeCorrection:(NSInteger)sizeCorrection;
+(void)setRegularFont:(UIFont*)regularFont;
+(void)setRegularInputFont:(UIFont*)regularInputFont;
+(void)setBoldFont:(UIFont*)boldFont;
+(void)setBoldInputFont:(UIFont*)boldInputFont;

// Utils:

// !!! All pt's will be affected by sizeCorrection value !!!

// Mimicks [ UIFont systemFontOfSize: ] method.
+(UIFont*)regularFontOfSize:(float)pt;

// Font for input, original font, not the one with hacked ascend and descent.
// See http://stackoverflow.com/questions/7535498/uibutton-custom-font-vertical-alignment
// Such a hacked font could not be used as font for text input controls.
+(UIFont*)regularInputFontOfSize:(float)pt;

// Mimicks [ UIFont boldSystemFontOfSize: ] method.
+(UIFont*)boldFontOfSize:(float)pt;
+(UIFont*)boldInputFontOfSize:(float)pt;

// Replace system fonts with custom fonts on the whole subviews hierarchy.
+(int)replaceFontsOnView:(UIView*)view;

// Replace system font with custom fonts on the specified control (can be UILabel, UITextField, other..)
+(BOOL)replaceFontsOnControl:(UIView*)control;

@end
