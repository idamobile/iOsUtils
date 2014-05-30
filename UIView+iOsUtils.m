
//
//  MiscUtilsUI.m
//  Home Credit
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

#import "UIView+iOsUtils.h"
#import "UIDevice+iOsUtils.h"
#import "CustomFonts.h"

@implementation UIView(iOsUtils)

-(CGFloat)x
{
	return self.frame.origin.x;
}

-(void)setX:(CGFloat)x
{
	CGRect seflFrame = self.frame;
	seflFrame.origin.x = x;
	self.frame = seflFrame;
}

-(CGFloat)y
{
	return self.frame.origin.y;
}

-(void)setY:(CGFloat)y
{
	CGRect seflFrame = self.frame;
	seflFrame.origin.y = y;
	self.frame = seflFrame;
}

-(CGFloat)width
{
	return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width
{
	CGRect seflFrame = self.frame;
	seflFrame.size.width = width;
	self.frame = seflFrame;
}

-(CGFloat)height
{
	return self.frame.size.height;
}

-(void)setHeight:(CGFloat) height
{
	CGRect seflFrame = self.frame;
	seflFrame.size.height = height;
	self.frame = seflFrame;
}

-(CGFloat)leftEdge
{
	return self.x;
}

-(void)setLeftEdge:(CGFloat)newLeft
{
	CGRect rc = self.frame;
	CGFloat right = rc.size.width + rc.origin.x;
	rc.origin.x = newLeft;
	rc.size.width = ( right - newLeft );
	rc = CGRectStandardize( rc );
	self.frame = rc;
}

-(CGFloat)rightEdge
{
	CGRect rc = self.frame;
	return rc.size.width + rc.origin.x;
}

-(void)setRightEdge:(CGFloat)newRight
{
	CGRect rc = self.frame;
	rc.size.width = newRight - rc.origin.x;
	rc = CGRectStandardize( rc );
	self.frame = rc;
}

-(CGFloat)topEdge
{
	return self.frame.origin.y;
}

-(void)setTopEdge:(CGFloat)newTop
{
	CGRect rc = self.frame;
	CGFloat bottom = rc.size.height + rc.origin.y;
	rc.origin.y = newTop;
	rc.size.height = ( bottom - newTop );
	rc = CGRectStandardize( rc );
	self.frame = rc;
}

-(CGFloat)bottomEdge
{
	CGRect rc = self.frame;
	return rc.size.height + rc.origin.y;
}

-(void)setBottomEdge:(CGFloat)newBottom
{
	CGRect rc = self.frame;
	rc.size.height = newBottom - rc.origin.y;
	rc = CGRectStandardize( rc );
	self.frame = rc;
}

-(CGSize)size
{
  return self.frame.size;
}

-(void)setSize:(CGSize)sz
{
	CGRect rc = self.frame;
	rc.size = sz;
	self.frame = rc;
}

-(CGRect)convertBoundsToView:(UIView*)view
{
  return [self convertRect:self.bounds toView:view];
}

-(void)centerHorizontallyInContainer
{
	CGRect rcContainer = self.superview.bounds;
	self.x = floorf( ( rcContainer.size.width - self.width ) / 2 );
}

-(void)centerVerticallyInContainer
{
	CGRect rcContainer = self.superview.bounds;
	self.y = floorf( ( rcContainer.size.height - self.height ) / 2 );
}

-(UIView*)findSubviewRecursivelyOfClass:(Class)subviewClass
{
  if( [self isKindOfClass:subviewClass] ) {
    return self;
  } else {
    for( UIView* child in self.subviews ) {
      UIView* result = [child findSubviewRecursivelyOfClass:subviewClass];
      if( result ) {
        return result;
      }
    }
    return nil;
  }
}

-(UIResponder*)findFirstResponderRecursively
{
  if( self.isFirstResponder ) {
    return self;
  } else {
    for( UIView* child in self.subviews ) {
      UIResponder* responder = [child findFirstResponderRecursively];
      if( responder ) {
        return responder;
      }
    }
    return nil;
  }
}

-(void)resignFirstResponderRecursively
{
  [[self findFirstResponderRecursively] resignFirstResponder];
}

-(void)heightToFit
{
  self.height = [self heightThatFits];
}

-(CGFloat)heightThatFits
{
  return [self sizeThatFits:self.bounds.size].height;
}

-(CGFloat)widthThatFits
{
  return [self sizeThatFits:self.bounds.size].width;
}

-(void)widthToFit
{
  self.width = [self widthThatFits];
}

+(instancetype)loadFromNibNamed:(NSString*)nibName owner:(id)owner options:(NSDictionary*)opts
{
  NSString* deviceSpecific = nil;
  if( [UIDevice isPad] ) {
    deviceSpecific = [nibName stringByAppendingString:@"~iPad"];
  } else {
    deviceSpecific = [nibName stringByAppendingString:@"~iPhone"];
  }

  NSString* chosenPath = nil;
  if( [[NSBundle mainBundle] pathForResource:deviceSpecific ofType:@"nib"] ) {
    chosenPath = deviceSpecific;
  } else if( [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"] ) {
    chosenPath = nibName;
  } else {
    DLog( @"Nib named %@ not found", nibName );
    return nil;
  }

  NSArray* nibViews = [[NSBundle mainBundle] loadNibNamed:chosenPath owner:owner options:opts];
  for( NSObject* currentObject in nibViews ) {
    if( [currentObject isKindOfClass:self] ) {
      [CustomFonts replaceFontsOnView:(UIView*)currentObject];
      return (UIView*)currentObject;
    }
  }

  DLog( @"Nib named %@ doesn't contain a view of class %@", nibName, NSStringFromClass( self ) );
  return nil;
}

+(instancetype)loadFromNib
{
  return [self loadFromNibNamed:NSStringFromClass(self) owner:nil options:nil];
}

@end
