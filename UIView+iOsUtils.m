
//
//  MiscUtilsUI.m
//  Home Credit
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

#import "UIView+iOsUtils.h"

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

@end
