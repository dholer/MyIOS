//
//  MBProgressHUDViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MBProgressHUDViewController.h"
#import "MBProgressHUD.h"
@interface MBProgressHUDViewController ()

@end

@implementation MBProgressHUDViewController

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

- (IBAction)HUBToHome:(id)sender {
    [self performSegueWithIdentifier:@"HUBToHome" sender:self];
}

- (IBAction)showSimple:(id)sender {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // Show the HUD while the provided method executes in a new thread
    [hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
}

- (IBAction)showWithLabel:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   
    hud.labelText = @"loading";
    hud.detailsLabelText = @"detail text";
    hud.square = YES;
    [hud showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
    
}

- (IBAction)showWithLabelDeterminate:(id)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.labelText = @"showWithLabelDeterminate";
    [hud showWhileExecuting:@selector(myProgressTask) onTarget:self withObject:nil animated:YES];
    
}

-(void) myTask
{
    NSLog(@"time sleep 2 seconds!");
    sleep(2);
}
- (void)myProgressTask {
	// This just increases the progress indicator in a loop
	float progress = 0.0f;
	while (progress < 1.0f) {
		progress += 0.01f;
		HUD.progress = progress;
		usleep(50000);
	}
}
@end
