//
//  UIComponentViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIComponentViewController.h"

@interface UIComponentViewController ()

@end

@implementation UIComponentViewController
@synthesize progressBar;
@synthesize rightSwitch;
@synthesize leftSwitch;
@synthesize sliderLable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.sliderLable.text = @"50";
}

- (void)viewDidUnload
{
    [self setSliderLable:nil];
    [self setRightSwitch:nil];
    [self setLeftSwitch:nil];
    [self setProgressBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sliderChanged:(UISlider *)sender {
    UISlider *slider =(UISlider *)sender;
    int progressAsInt = (int)roundf(slider.value);
    
    float progressValue = roundf(slider.value)/100;
    [self.progressBar setProgress:progressValue animated:YES];
    NSLog(@"%f",progressValue);
    self.sliderLable.text = [NSString stringWithFormat:@"%i",progressAsInt];
    
}
- (IBAction)switchChanged:(UISwitch *)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    BOOL setting = mySwitch.isOn; //get switch status
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];	
}
@end
