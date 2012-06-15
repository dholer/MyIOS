//
//  dholerViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "dholerViewController.h"

@interface dholerViewController ()

@end

@implementation dholerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)goToJSON:(id)sender {
    [self performSegueWithIdentifier:@"goToJSON" sender:self];
}

- (IBAction)goASIHTTPRequest:(id)sender {
    [self performSegueWithIdentifier:@"goASIHTTPRequest" sender:self];
}

- (IBAction)goHUB:(id)sender {
    [self performSegueWithIdentifier:@"goHUB" sender:self];
}
@end
