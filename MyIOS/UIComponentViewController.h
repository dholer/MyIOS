//
//  UIComponentViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIComponentViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;


@property (weak, nonatomic) IBOutlet UISwitch *rightSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *leftSwitch;
@property (weak, nonatomic) IBOutlet UILabel *sliderLable;


- (IBAction)switchChanged:(UISwitch *)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
@end
