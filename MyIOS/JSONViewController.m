//
//  JSONViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JSONViewController.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"

@interface JSONViewController ()

@end

@implementation JSONViewController
@synthesize textField = _textField;
@synthesize textView = _textView;

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
    [self setTextView:nil];
    [self setTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)backToHome:(id)sender {
    [self performSegueWithIdentifier:@"JSONToHome" sender:self];
}

- (IBAction)callApi:(id)sender {
    NSString *code = self.textField.text;    
    NSLog(@"textField value is :%@",code);  
    NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/projects/api/promos.php"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:code forKey:@"code"];
    [request setDelegate:self];
    [request startAsynchronous];
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"loading api";    
}

- (void) requestFinished:(ASIHTTPRequest *)request
{        
    
    if(request.responseStatusCode == 200){    
    
        NSString *response = [request responseString];
        self.textView.text = response;
        NSLog(@"%@",response);
        
        NSDictionary *responseDict = [response JSONValue];
        NSString *code = [responseDict objectForKey:@"code"];
        NSLog(@"respose data is: %@",code);
        
    }else if (request.responseStatusCode == 404) {        
        
        self.textView.text = @"not found!";
        
    }else {
        
        self.textView.text = @"unexpected error!";
        
    }
    
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}
- (void) requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    NSLog(@"%@",error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    NSLog(@"return:%@",textField.text);
    return YES;
}
@end
