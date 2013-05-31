//
//  UIView+iOsUtils.h
//  iOsUtils
//
//  Created by Konstantin Gontarenko on 11/4/11.
//  Copyright (c) 2011 iDa Mobile. All rights reserved.
//

@interface UIView(iOsUtils)

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

-(CGRect)convertBoundsToView:(UIView*)view;

// Same as "Center horizontally in container" interface builder command.
-(void)centerHorizontallyInContainer;
-(void)centerVerticallyInContainer;

-(UIView*)findSubviewRecursivelyOfClass:(Class)subviewClass;
-(UIResponder*)findFirstResponderRecursively;
-(void)resignFirstResponderRecursively;

-(CGFloat)heightThatFits;
-(void)heightToFit;
-(CGFloat)widthThatFits;
-(void)widthToFit;

+(instancetype)loadFromNibNamed:(NSString*)nibName owner:(id)owner options:(NSDictionary*)opts;
+(instancetype)loadFromNib;

@end
