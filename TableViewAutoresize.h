//
//  TableViewAutoresize.h
//  Home Credit
//
//  Created by Aleksey Kozhevnikov on 06.06.12.
//  Copyright (c) 2012 iDa Mobile. All rights reserved.
//

@class TableViewAutoresize;

@protocol TableViewAutoresizeDelegate
@optional
-(NSIndexPath*)scrollingPathIn:(TableViewAutoresize*)sender;
@end

@interface TableViewAutoresize : UITableView
@property(nonatomic, assign) IBOutlet NSObject<TableViewAutoresizeDelegate>* autoresizeDelegate;
@end
