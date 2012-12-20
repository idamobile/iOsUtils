//
//  PositionAwareCell.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 20.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

typedef enum {
  CP_Top,
  CP_Middle, // default
  CP_Bottom,
  CP_Alone,

  CP_Count // auxiliary
} e_CellPosition;

@interface PositionAwareCell : UITableViewCell

// Return class name
+(NSString*)reuseId;
-(NSString*)reuseIdentifier;

// CP_Middle by default
@property(nonatomic, assign) e_CellPosition position;

+(e_CellPosition)positionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection;
-(void)setCellPositionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection;

// To override
+(UIImage*)backgroundImageForPosition:(e_CellPosition)position;

@end
