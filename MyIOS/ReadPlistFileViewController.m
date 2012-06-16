//
//  ReadPlistFileViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ReadPlistFileViewController.h"

@interface ReadPlistFileViewController ()

@end

@implementation ReadPlistFileViewController
@synthesize stuName;
@synthesize stuSex;
@synthesize stuNum;
@synthesize mtrName;
@synthesize mtrSex;
@synthesize mtrNum;

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
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"customInfo" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSDictionary *studentInfo = [dict objectForKey:@"Student"];
    NSLog(@"value:%@",[studentInfo objectForKey:@"Name"]);
    self.stuName.text = [studentInfo objectForKey:@"Name"];
    self.stuSex.text = [studentInfo objectForKey:@"Sex"];
    self.stuNum.text = [studentInfo objectForKey:@"Num"];
    
    NSDictionary *mentorInfo =[dict objectForKey:@"Mentor"];
    self.mtrName.text = [mentorInfo objectForKey:@"Name"];
    self.mtrSex.text = [mentorInfo objectForKey:@"Sex"];
    self.mtrNum.text = [mentorInfo objectForKey:@"Num"];
    
}

- (void)viewDidUnload
{
    [self setStuName:nil];
    [self setStuSex:nil];
    [self setStuNum:nil];
    [self setMtrName:nil];
    [self setMtrSex:nil];
    [self setMtrNum:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
