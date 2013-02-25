//
//  UITextViewWithPlaceholder.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 22.02.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "UITextViewWithPlaceholder.h"
#import "UIView+iOsUtils.h"

@implementation UITextViewWithPlaceholder

-(id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if( !self ) {
    return nil;
  }
  [self commonInit];
  return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if( !self ) {
    return nil;
  }
  [self commonInit];
  return self;
}

-(void)commonInit
{
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleTextChange:)
                                               name:UITextViewTextDidChangeNotification
                                             object:self];
}

-(void)setText:(NSString *)text
{
  [super setText:text];
  [self setNeedsDisplay];
}

-(void)handleTextChange:(NSNotification*)notification
{
  [self setNeedsDisplay];
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont
{
  _placeholderFont = placeholderFont;
  [self setNeedsDisplay];
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
  _placeholderColor = placeholderColor;
  [self setNeedsDisplay];
}

-(void)setPlaceholderText:(NSString *)placeholderText
{
  _placeholderText = [placeholderText copy];
  [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  if( self.placeholderText && self.text.length == 0 ) {
    UIFont* font = self.placeholderFont ? self.placeholderFont : self.font;
    if( self.placeholderColor ) {
      [self.placeholderColor set];
    } else {
      [[UIColor colorWithWhite:0.7 alpha:1] set];
    }
    [self.placeholderText drawInRect:CGRectMake(8, 8, self.width - 16, self.height - 16)
                            withFont:font];
  }
}

-(void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextViewTextDidChangeNotification
                                                object:self];
  _placeholderText = nil;
  _placeholderFont = nil;
  _placeholderColor = nil;
}

@end
