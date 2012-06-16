//
//  ProvinceCityViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kProvinceComponent 0
#define kCityComponent 1

@interface ProvinceCityViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *picker;


@property (strong, nonatomic) NSDictionary *provinceCities;
@property (strong, nonatomic) NSArray *provinces;
@property (strong, nonatomic) NSArray *cities;


- (IBAction)buttonPressed:(id)sender;

@end
