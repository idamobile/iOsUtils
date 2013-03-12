//
//  ButtonInformsHighlight.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 13.03.13.
//  Copyright (c) 2013 iDa Mobile. All rights reserved.
//

@class ButtonInformsHighlight;

@protocol ButtonInformsHighlightDelegate<NSObject>

-(void)button:(ButtonInformsHighlight*)button highlightChanged:(BOOL)highlighted;

@end

@interface ButtonInformsHighlight : UIButton

@property(nonatomic, weak) IBOutlet id<ButtonInformsHighlightDelegate> delegate;

@end
