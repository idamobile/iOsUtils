//
//  NSObject+AssociatedObject.m
//  Instabank
//
//  Created by Andrey Toropchin on 14.07.14.
//  Copyright (c) 2014 iDa Mobile. All rights reserved.
//

#import "NSObject+AssociatedObject.h"

@implementation NSObject (AssociatedObject)

@dynamic associatedObject;

- (void)setAssociatedObject:(id)object
{
  objc_setAssociatedObject(self, @selector(associatedObject), object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)associatedObject
{
  return objc_getAssociatedObject(self, @selector(associatedObject));
}

@end
