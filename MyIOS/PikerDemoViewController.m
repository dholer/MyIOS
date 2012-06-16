//
//  PikerDemoViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PikerDemoViewController.h"

@interface PikerDemoViewController ()

@end

@implementation PikerDemoViewController

@synthesize myPickerView;
@synthesize myPickerData;
@synthesize myPickerData_2;

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
    NSArray *array = [[NSArray alloc] initWithObjects:@"Horse", @"Sheep", @"Pig", @"Dog", @"Cat", @"Chicken", @"Duck", @"Goose", nil]; 
    self.myPickerData = array;
    NSArray *array_2 = [[NSArray alloc] initWithObjects:@"Tree", @"Flower", @"Grass", @"Fence", @"House", @"Table", @"Chair", @"Book",@"Swing" , nil]; 
    self.myPickerData_2 = array_2; 
}

- (void)viewDidUnload
{
    [self setMyPickerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.myPickerView = nil;
    self.myPickerData = nil;
    self.myPickerData_2 = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnPressed:(id)sender {
    
    NSInteger row = [myPickerView selectedRowInComponent:0]; 
    NSInteger row_2 = [myPickerView selectedRowInComponent:1];
    
    NSString *selected = [myPickerData objectAtIndex:row];
    NSString *selected_2 = [myPickerData_2 objectAtIndex:row_2];
    
    NSString *msg = [[NSString alloc] initWithFormat: 
                     @"You selected %@ and %@!", selected, selected_2]; 
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello!" 
                                                    message:msg 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Yes, I Did." 
                                          otherButtonTitles:nil]; 
    [alert show]; 
}
#pragma mark - 
#pragma mark Picker Data Source Methods 
//选中Picker View控件，打开Connections Inspector，找到delegate和datasource，从它们右边的圆圈拉线到File’s Owner：


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView { 
    return 2; 
} 

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component { 
    if (component == 0) {
        return [myPickerData count]; 
    }
    return [myPickerData_2 count];
} 

#pragma mark Picker Delegate Methods 
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row             forComponent:(NSInteger)component { 
    if (component == 0) {
        return [myPickerData objectAtIndex:row]; 
    }
    return [myPickerData_2 objectAtIndex:row];
}
@end
