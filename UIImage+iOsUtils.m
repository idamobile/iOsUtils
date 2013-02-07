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
		DLog( @"Warning: image named %@ was not found in the main bundle", name );
		return nil;
	}
	
	CGSize sz = img.size;
  
  if( [img respondsToSelector:@selector(resizableImageWithCapInsets:)] ) {
    int left = (sz.width - 1.) / 2.;
    int top = (sz.height - 1.) / 2.;
    //insets are symmetric
    return [img resizableImageWithCapInsets:UIEdgeInsetsMake( top, left, top, left )];
  } else {
    return [img stretchableImageWithLeftCapWidth:( sz.width / 2 ) topCapHeight:( sz.height / 2 )];
  }
}

+(UIImage*)safeImageNamed:(NSString*)imageName
{
  UIImage* image = [UIImage imageNamed:imageName];
  if( !image ) {
    DLog( @"Failed to load image named %@", imageName );
  }
  return image;
}

-(UIImage*)cropFromRect:(CGRect)fromRect
{
  fromRect = CGRectMake(fromRect.origin.x * self.scale,
                        fromRect.origin.y * self.scale,
                        fromRect.size.width * self.scale,
                        fromRect.size.height * self.scale);
  CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, fromRect);
  UIImage* crop = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
  CGImageRelease(imageRef);
  return crop;
}

@end
