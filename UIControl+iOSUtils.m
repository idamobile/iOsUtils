//
//  UIControl+iOSUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 04.04.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

#import "UIControl+iOSUtils.h"

@implementation UIControl(iOSUtils)

-(void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
	NSSet* targets = [self allTargets];
	for( id currentTarget in targets ) {
		NSArray* actions = [self actionsForTarget:currentTarget forControlEvent:controlEvents];
		for( NSString* currentAction in actions ) {
			[self removeTarget:currentTarget action:NSSelectorFromString(currentAction) forControlEvents:controlEvents];
		}
	}
	[self addTarget:target action:action forControlEvents:controlEvents];
}

@end
