//
//  KeyboardDelegateViewController.h
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardDelegateViewController : UIViewController<UITextFieldDelegate>
-(BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
