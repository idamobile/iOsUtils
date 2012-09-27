//
//  UIImage+iOsUtils.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 27.09.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UIImage+iOsUtils.h"

@implementation UIImage(iOsUtils)

+(UIImage*)stretchableImageNamed:(NSString*)name
{
	UIImage *img = [UIImage imageNamed:name];
	if( !img ) {
		NSLog( @"Warning: image named %@ was not found in the main bundle", name );
		return nil;
	}
	
	CGSize sz = img.size;
  
  if( [img respondsToSelector:@selector(resizableImageWithCapInsets:)] ) {
    int left = (int)(sz.width / 2.);
    int top = (int)(sz.height / 2.);
    //insets are symmetric
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake( top, left, top, left )];
  } else {
    return [img stretchableImageWithLeftCapWidth:( sz.width / 2 ) topCapHeight:( sz.height / 2 )];
  }
}

@end
