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
    
    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"action sheet title" delegate:self cancelButtonTitle:@"will cancel" destructiveButtonTitle:@"Are you sure" otherButtonTitles:nil];
    
    [actionsheet addButtonWithTitle:@"button1"];
    [actionsheet addButtonWithTitle:@"button2"];
    //maybe in ipad
    //[actionsheet showInView:self.view];
    
    //in iphone
    [actionsheet showInView:[UIApplication sharedApplication].keyWindow];

}

- (IBAction)switchChanged:(UISwitch *)sender {
    UISwitch *mySwitch = (UISwitch *)sender;
    BOOL setting = mySwitch.isOn; //get switch status
    [leftSwitch setOn:setting animated:YES];
    [rightSwitch setOn:setting animated:YES];	
}
@end
