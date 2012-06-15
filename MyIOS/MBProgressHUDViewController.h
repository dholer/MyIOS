//
//  MBProgressHUDViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface MBProgressHUDViewController : UIViewController<MBProgressHUDDelegate>
{
    MBProgressHUD * HUD;
}
- (IBAction)HUBToHome:(id)sender;
- (IBAction)showSimple:(id)sender;
- (IBAction)showWithLabel:(id)sender;
- (IBAction)showWithLabelDeterminate:(id)sender;

- (void)myTask;
- (void)myProgressTask;
@end
