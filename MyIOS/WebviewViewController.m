//
//  WebviewViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WebviewViewController.h"
#import "MBProgressHUD.h"
@interface WebviewViewController ()

@end

@implementation WebviewViewController
@synthesize webView;

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
    self.webView.delegate = self;
    self.webView.backgroundColor = [UIColor clearColor];
    //self.webView.scrollView.scrollEnabled = NO;
    //self.webView.userInteractionEnabled = NO;
    
    //If YES, the webpage is scaled to fit and the user can zoom in and zoom out. If NO, user zooming is disabled. The default value is NO.
    //Available in iOS 2.0 and later.
    self.webView.scalesPageToFit = NO;
    //NSURL *url = [NSURL URLWithString:@"http://127.0.0.1/projects/webview/index.html"];
    //NSURL *url = [NSURL URLWithString:@"http://www.facebook.com"];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[self.webView loadRequest:request];
    
    
    [self loadPage];
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"loading";
    
    
    
    
}
- (void) webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSString *currentUrl = [self.webView stringByEvaluatingJavaScriptFromString:@"window.document.location.href;"];
    
    NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"URL:%@  title:%@",currentUrl,title);
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    NSString *stringUrl = [[request URL] absoluteString];
    NSLog(@"stringUrl is:%@",stringUrl);
    
    NSArray *urlComps = [stringUrl componentsSeparatedByString:@":"];
    
    if([urlComps count] && [[urlComps objectAtIndex:0] isEqualToString:@"objc"])
    {        
        NSString *funcStr = [urlComps objectAtIndex:1];        
        if([funcStr isEqualToString:@"doFunc1"])            
        {
            /*调用本地函数1*/   
            NSLog(@"func1");  
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"msg" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
            [alert show];
        }        
        else if([funcStr isEqualToString:@"doFunc2"])            
        {            
            /*调用本地函数2*/ 
            NSLog(@"func2");
            [self.webView stringByEvaluatingJavaScriptFromString:@"alert('fun2 exec')"];
        }        
        return NO;        
    }
    return YES;
} 


- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) loadPage
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"masks" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}
@end
