//
//  FMDBViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMDBViewController : UIViewController
- (IBAction)execSql:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end
