//
//  Sqlite3ViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Sqlite3ViewController : UIViewController
- (IBAction)goHoume:(id)sender;
- (IBAction)btnPressed:(id)sender;
@property (nonatomic,copy) NSString *databaseFilePath;
@end
