//
//  AddButtonViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddButtonViewController.h"

@interface AddButtonViewController ()

@end

@implementation AddButtonViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addButton:(id)sender {
    CGRect frame = CGRectMake(20, 100, 200, 40);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    
    [button setTitle:@"add a button" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.tag = 2000;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
        
}

- (IBAction)buttonPressed:(id)sender
{
    NSLog(@"button pressed!");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"This is a alert view" message:@" alert message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles: nil];
    [alert show];
}
  
@end
