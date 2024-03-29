//
//  UITextViewWithPlaceholder.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 22.02.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "UITextFieldCustomPlaceholder.h"

@interface UITextFieldCustomPlaceholder()

@property(nonatomic, copy) NSString* customPlaceholder;

@end

@implementation UITextFieldCustomPlaceholder

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
                                               name:UITextFieldTextDidChangeNotification
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

-(CGRect)caretRectForPosition:(UITextPosition*)position
{
  CGRect result = [super caretRectForPosition:position];
  if( self.text.length == 0 ) {
    UIFont* font = self.placeholderFont ? self.placeholderFont : self.font;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wenum-conversion"
    CGSize placeholderSize = [self.customPlaceholder sizeWithFont:font
                                                constrainedToSize:CGSizeMake(self.width - 8, self.height - 4)
                                                    lineBreakMode:NSLineBreakByWordWrapping];
#pragma clang diagnostic pop
    return CGRectMake((self.width + placeholderSize.width) / 2, result.origin.y, result.size.width, result.size.height);
  }
  return result;
}

-(void)setPlaceholder:(NSString*)placeholder
{
  _customPlaceholder = [placeholder copy];
  [super setPlaceholder:@""];
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

-(void)drawRect:(CGRect)rect
{
  [super drawRect:rect];
  if( self.customPlaceholder && self.text.length == 0 ) {
    UIFont* font = self.placeholderFont ? self.placeholderFont : self.font;
    if( self.placeholderColor ) {
      [self.placeholderColor set];
    } else {
      [[[self class] defaultPlaceholderColor] set];
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#pragma clang diagnostic ignored "-Wenum-conversion"
    CGSize placeholderSize = [self.customPlaceholder sizeWithFont:font
                                                constrainedToSize:CGSizeMake(self.width - 8, self.height - 4)
                                                    lineBreakMode:NSLineBreakByWordWrapping];
    CGFloat vOffset = (self.height - placeholderSize.height) / 2;
    [self.customPlaceholder drawInRect:CGRectMake(4, vOffset, self.width - 8, self.height - 2 * vOffset)
                              withFont:font
                         lineBreakMode:NSLineBreakByWordWrapping
                             alignment:self.textAlignment];
#pragma clang diagnostic pop
  }
}

-(void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:UITextFieldTextDidChangeNotification
                                                object:self];
  _customPlaceholder = nil;
  _placeholderFont = nil;
  _placeholderColor = nil;
}

@end
