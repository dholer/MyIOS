//
//  TableViewViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray *list;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
