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

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"%i",buttonIndex);
    
    if (buttonIndex == actionSheet.cancelButtonIndex) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"you select cancel" message:@"Are you sure?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil];
        [alert show];       
        
        NSLog(@"cancel button clicked");
        return;
    }else if(buttonIndex == actionSheet.destructiveButtonIndex){
        
        UIDatePicker *datePicker = (UIDatePicker *)[actionSheet viewWithTag:101];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"MM/dd/YY h:mm a";
        NSString *timestamp = [formatter stringFromDate:datePicker.date];
        //显示时间的变量 
        NSLog(@"%@",timestamp);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"you select cancel"
                                                        message:[NSString stringWithFormat:@"current time is:%@",timestamp]
                                                       delegate:self 
                                              cancelButtonTitle:@"cancel"                               
                                              otherButtonTitles:nil
                              ];
        [alert show];
        
    }
    
    switch (buttonIndex) {
        case 0: {
            NSLog(@"Item 1 Selected");
            break;
        }
        case 1: {
            NSLog(@"Item 2 Selected");
            break;
        }
        case 2: {
            NSLog(@"Item 3 Selected");
            break;
        }
    }
    
}

- (IBAction)callActionsheet:(id)sender {
    NSString *title = UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation) ? @"\n\n\n\n\n\n\n\n\n" : @"\n\n\n\n\n\n\n\n\n\n\n\n" ;
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:title 
                                                             delegate:self 
                                                    cancelButtonTitle:@"cancel"
                                               destructiveButtonTitle:@"set time"
                                                    otherButtonTitles:nil];
    
    //maybe in ipad
    //[actionsheet showInView:self.view];
    
    //in iphone
    [actionsheet showInView:[UIApplication sharedApplication].keyWindow];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.tag = 101;
    // datePicker.datePickerMode = [(UISegmentedControl *)self.navigationItem.titleView selectedSegmentIndex];
    
    [actionsheet addSubview:datePicker];

}

- (IBAction)switchChanged:(UISwitch *)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    BOOL setting = mySwitch.isOn; //get switch status
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];	
}


@end
