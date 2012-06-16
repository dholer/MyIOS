//
//  DateAndTimeViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateAndTimeViewController.h"

@interface DateAndTimeViewController ()

@end

@implementation DateAndTimeViewController
@synthesize dateLabel;
@synthesize timeLabel;

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
    [self setDateLabel:nil];
    [self setTimeLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
//每次切换到这个试图，显示切换时的日期和时间
- (void)viewWillAppear:(BOOL)animated {
    NSDate *now = [NSDate date];
    dateLabel.text = [NSDateFormatter
                      localizedStringFromDate:now
                      dateStyle:NSDateFormatterLongStyle
                      timeStyle:NSDateFormatterNoStyle];
    timeLabel.text = [NSDateFormatter
                      localizedStringFromDate:now
                      dateStyle:NSDateFormatterNoStyle
                      timeStyle:NSDateFormatterLongStyle];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
