//
//  JSONViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSONViewController : UIViewController<UITextFieldDelegate>
- (IBAction)backToHome:(id)sender;
- (IBAction)callApi:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
