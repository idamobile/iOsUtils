//
//  CustomFonts.m
//  UBRD
//
//  Created by Aleksey Kozhevnikov on 23.08.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "CustomFonts.h"

@interface CustomFonts ()

// Corrects the font size so that the new fonts size matched the given input font size.
@property(nonatomic, assign) NSInteger sizeCorrection;
@property(nonatomic, retain) UIFont* regularFont;
@property(nonatomic, retain) UIFont* regularInputFont;
@property(nonatomic, retain) UIFont* boldFont;
@property(nonatomic, retain) UIFont* boldInputFont;

@end

@implementation CustomFonts

@synthesize sizeCorrection, regularFont, regularInputFont, boldFont, boldInputFont;

+(CustomFonts*)sharedCustomFonts
{
  static CustomFonts* shared = nil;
  static dispatch_once_t onceToken;
  dispatch_once( &onceToken, ^{
    shared = [[CustomFonts alloc] init];
  } );
  return shared;
}

+(void)setSizeCorrection:(NSInteger)sizeCorrection
{
  [self sharedCustomFonts].sizeCorrection = sizeCorrection;
}

+(void)setRegularFont:(UIFont*)regularFont
{
  [self sharedCustomFonts].regularFont = regularFont;
}

+(void)setRegularInputFont:(UIFont*)regularInputFont
{
  [self sharedCustomFonts].regularInputFont = regularInputFont;
}

+(void)setBoldFont:(UIFont*)boldFont
{
  [self sharedCustomFonts].boldFont = boldFont;
}

+(void)setBoldInputFont:(UIFont*)boldInputFont
{
  [self sharedCustomFonts].boldInputFont = boldInputFont;
}

+(UIFont*)regularFontOfSize:(float)pt
{
	return [[self sharedCustomFonts].regularFont fontWithSize:pt + [self sharedCustomFonts].sizeCorrection];
}

+(UIFont*)regularInputFontOfSize:(float)pt
{
  return [[self sharedCustomFonts].regularInputFont fontWithSize:pt + [self sharedCustomFonts].sizeCorrection];
}

+(UIFont*)boldFontOfSize:(float)pt
{
	return [[self sharedCustomFonts].boldFont fontWithSize:pt + [self sharedCustomFonts].sizeCorrection];
}

+(UIFont*)boldInputFontOfSize:(float)pt
{
	return [[self sharedCustomFonts].boldInputFont fontWithSize:pt + [self sharedCustomFonts].sizeCorrection];
}

+(UIFont*)produceCustomFont:(UIFont*)oldFont
{
  if( [[oldFont fontName] rangeOfString:@"Bold"].location != NSNotFound ) {
    return [self boldFontOfSize:oldFont.pointSize];
  }
  return [self regularFontOfSize:oldFont.pointSize];
}

+(UIFont*)produceCustomInputFont:(UIFont*)oldFont
{
  if( [[oldFont fontName] rangeOfString:@"Bold"].location != NSNotFound ) {
    return [self boldInputFontOfSize:oldFont.pointSize];
  }
  return [self regularInputFontOfSize:oldFont.pointSize];
}

+(BOOL)replaceFontsOnControl:(UIView*)view
{
	if( ![view respondsToSelector:@selector( font )] || ![view respondsToSelector:@selector( setFont: )] ) {
    return NO;
  }

	UIFont *oldFont = [view performSelector:@selector(font)];
	if( ![oldFont isKindOfClass:[UIFont class]] ) {
    return NO;
  }

  UIFont* newFont = nil;
  if( [view isKindOfClass:[UITextView class]] && [view isKindOfClass:[UITextField class]] ) {
    newFont = [self produceCustomInputFont:oldFont];
  } else {
    newFont = [self produceCustomFont:oldFont];
  }
  // Mechanism not initialized
  if( !newFont ) {
    return NO;
  }
  [view performSelector:@selector( setFont: ) withObject:newFont];
  return YES;
}

+(int)replaceFontsOnView:(UIView*)view
{
  int res = 0;
  // If this view has a font property, set it.
  if( [self replaceFontsOnControl:view] ) {
    res = 1;
  }
  // Recursion.
  for( UIView* child in view.subviews ) {
    res += [self replaceFontsOnView:child];
  }
  return res;
}

@end
