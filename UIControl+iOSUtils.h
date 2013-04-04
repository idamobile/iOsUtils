//
//  UIControl+iOSUtils.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 04.04.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

@interface UIControl(iOSUtils)

-(void)setTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
