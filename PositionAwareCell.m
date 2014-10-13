//
//  PositionAwareCell.m
//  Instabank
//
//  Created by Aleksey Kozhevnikov on 20.12.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

#import "PositionAwareCell.h"

@implementation PositionAwareCell

UITableViewCellDefineClassSpecificReuseId

-(id)initWithCoder:(NSCoder *)aDecoder
{
  self = [super initWithCoder:aDecoder];
  if( !self ) {
    return nil;
  }
  [self commonInit];
  return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if( !self ) {
    return nil;
  }
  [self commonInit];
  return self;
}

-(void)commonInit
{
  self.position = CP_Middle;
}

-(void)setPosition:(e_CellPosition)position
{
  _position = position;
  NSAssert(position != CP_Count, @"CP_Count is auxiliary value");
  UIImage* image = [self.class backgroundImageForPosition:position];
  self.backgroundView = [[UIImageView alloc] initWithImage:image];
  self.selectionStyle = UITableViewCellSelectionStyleNone;
// self.selectedBackgroundView = [[UIImageView alloc] initWithImage:image];
}

+(e_CellPosition)positionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection
{
  if( cellsInSection <= 1 ) {
    NSAssert((row == 0) && (cellsInSection == 1), @"Section should contain at least one cell with row index equals to zero");
    return CP_Alone;
  } else if( row == 0 ) {
    return CP_Top;
  } else if( row == (cellsInSection - 1) ) {
    return CP_Bottom;
  } else {
    return CP_Middle;
  }
}

+(e_CellPosition)positionForTable:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
  NSInteger cellsInSection = [tableView.dataSource tableView:tableView numberOfRowsInSection:indexPath.section];
  return [self positionForRow:indexPath.row totalCellsInSection:cellsInSection];
}

-(void)setCellPositionForRow:(NSInteger)row totalCellsInSection:(NSInteger)cellsInSection
{
  self.position = [[self class] positionForRow:row totalCellsInSection:cellsInSection];
}

-(void)setCellPositionForTable:(UITableView*)tableView indexPath:(NSIndexPath*)indexPath
{
  self.position = [[self class] positionForTable:tableView indexPath:indexPath];
}

+(UIImage*)backgroundImageForPosition:(e_CellPosition)position
{
  return nil;
}

@end
