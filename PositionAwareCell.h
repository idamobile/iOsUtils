//
//  PositionAwareCell.h
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 20.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "UITableViewCell+iOsUtils.h"

typedef enum {
  CP_Top,
  CP_Middle, // default
  CP_Bottom,
  CP_Alone,

  CP_Count // auxiliary
} e_CellPosition;

@interface PositionAwareCell : UITableViewCell

UITableViewCellDeclareClassSpecificReuseId

// CP_Middle by default
@property(nonatomic, assign) e_CellPosition position;

+(e_CellPosition)positionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection;
+(e_CellPosition)positionForTable:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;
-(void)setCellPositionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection;
-(void)setCellPositionForTable:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath;

// To override
+(UIImage*)backgroundImageForPosition:(e_CellPosition)position;

@end
