//
//  KeyboardViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (weak, nonatomic) IBOutlet UITextField *thirdTextField;

-(IBAction)textFieldReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;
@end
