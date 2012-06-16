//
//  PikerDemoViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PikerDemoViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;

- (IBAction)btnPressed:(id)sender;

@property (strong, nonatomic) NSArray *myPickerData;
@property (strong, nonatomic) NSArray *myPickerData_2;

@end
