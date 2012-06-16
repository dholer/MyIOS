//
//  CustomCellViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) NSArray *imageList;

@end
