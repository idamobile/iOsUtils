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

+(UIColor*)defaultPlaceholderColor
{
  return [UIColor colorWithWhite:0.7 alpha:1];
}

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
  if ([self.text length] > 255)
    self.text = [self.text substringToIndex:255];

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
      [[[self class] defaultPlaceholderColor] set];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wenum-conversion"
    [self.placeholderText drawInRect:CGRectMake(2., 7., self.width, self.height)
                            withFont:font
                       lineBreakMode:NSLineBreakByWordWrapping
                           alignment:self.textAlignment];
#pragma clang diagnostic pop
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
