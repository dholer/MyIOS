//
//  ViewControllersViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllersViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *listData;


- (IBAction)goHome:(id)sender;

@end
