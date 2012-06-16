//
//  KeyboardViewController.m
//  MyIOS
//
//  Created by Logic Solutions on 6/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()

@end

@implementation KeyboardViewController
@synthesize firstTextField;
@synthesize secondTextField;
@synthesize thirdTextField;

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
    [self setFirstTextField:nil];
    [self setSecondTextField:nil];
    [self setThirdTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)textFieldReturnEditing:(id)sender
{
    //所谓 First Responder 指的就是用户当前正在与之交互的控件。当用户使用键盘时，First Responder 就是这个键盘，resignFirstResponder 方法，顾名思义，就是放弃 First Responder
    //让这三个文本框都映射到 textFiledReturnEditing 方法，不过此时的事件应当是 Did End On Exit ，具体操作是：
    
    //打开 Assistant Editor  ，左边打开 ViewController.xib ，右边打开 ViewController.h ，在 Xcode 最右边打开 Connector Inspector ，然后在 View 中选择第一个文本框，在 Connector Inspector 中找到 Did End On Exit ，从它右边的圆圈中拉出映射线，映射到 ViewController.h 的 textFiledReturnEditing 方法
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender{
    //[firstField resignFirstResponder];表示，如果firstField有FirstResponder的话就放弃它，我们不用先判断firstField是否有，这条语句完全正确。
    
    //将背景view的类别设置为UIControl，这样我们就能对屏幕的事件进行处理了，将Control的touch down输出连接到backgroundTap事件上，因为点击软键盘会触发did end on exit，那我们就把两个textFiled的did end on exit输出连接到textFiledReturnEditing事件上。当然我们不要忘记将两个textFiled控件的输出与ViewController的相应控件接口连接在一起。
    [firstTextField resignFirstResponder];
    [secondTextField resignFirstResponder];
    [thirdTextField resignFirstResponder];
}

@end
