//
//  UIView+iOsUtils.h
//  iOsUtils
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

@interface UIView(MiscUtils)

@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, assign) CGFloat width;
@property(nonatomic, assign) CGFloat height;

@property(nonatomic, assign) CGFloat leftEdge;
@property(nonatomic, assign) CGFloat rightEdge;
@property(nonatomic, assign) CGFloat topEdge;
@property(nonatomic, assign) CGFloat bottomEdge;

// When setting the size, the anchor is the upper-left corner of the view.
@property(nonatomic, assign) CGSize size;

// Same as "Center horizontally in container" interface builder command.
-(void)centerHorizontallyInContainer;
-(void)centerVerticallyInContainer;

@end
