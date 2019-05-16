//
//  ViewController1.m
//  ZYSuspensionViewDemo
//
//  GitHub https://github.com/ripperhe
//  Created by ripper on 2017/3/7.
//  Copyright © 2017年 ripper. All rights reserved.
//

#import "ViewController1.h"
#import "ZYSuspensionView.h"

@interface ViewController1 ()<ZYSuspensionViewDelegate>

@property (nonatomic, weak) ZYSuspensionView *susView;

@property (nonatomic, strong) UIWindow *testWindow;
@end

@implementation ViewController1

-(void)dealloc
{
    // In order not to affect other demo
//    [self.susView removeFromScreen];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"SuspensionView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Just create a ZYSuspensionView
    UIColor *color = [UIColor colorWithRed:0.97 green:0.30 blue:0.30 alpha:1.00];
    ZYSuspensionView *susView = [[ZYSuspensionView alloc] initWithFrame:CGRectMake([ZYSuspensionView suggestXWithWidth:100], 200, 50, 50)
                                                               color:color
                                                            delegate:self];
    susView.leanType = ZYSuspensionViewLeanTypeEachSide;
    [susView setTitle:@"JSUT" forState:UIControlStateNormal];
    [susView show];
    self.susView = susView;
	
	[self testShowtestWindow];
	[self testTextfiled];
}

- (void)testShowtestWindow {
	
	UIWindow *testWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 30, 60, 60)];
	//    backWindow.rootViewController = [[ZYSuspensionViewController alloc] init];
	testWindow.rootViewController = [[UIViewController alloc] init];
	
	UIButton *testButton  =[UIButton buttonWithType:UIButtonTypeCustom];
	testButton.frame = testWindow.bounds;
	[testButton setTitle:@"按钮" forState:UIControlStateNormal];
	[testButton addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	testButton.backgroundColor = [UIColor greenColor];

	[testWindow.rootViewController.view addSubview:testButton];
	
	[testWindow makeKeyAndVisible];
//	[testWindow setHidden:NO];
	self.testWindow = testWindow;
}

- (void)testTextfiled {
	UITextField *testTextfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 100, 30)];
	testTextfield.borderStyle = UITextBorderStyleRoundedRect;
	
	[self.view addSubview:testTextfield];
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (void)testButtonClick:(UIButton *)sender {
	NSLog(@"点击了悬浮窗的测试按钮chiyz");
	UIWindow *window = [UIApplication sharedApplication].keyWindow;
	NSLog(@"keyWIndo = %@",window);
	for(window in [UIApplication sharedApplication].windows) {
		NSLog(@"windo = %@windo.windowLevel = %f",window,window.windowLevel);
//		if (window.windowLevel == UIWindowLevelNormal)
//			break;
	}
}

#pragma mark - ZYSuspensionViewDelegate
- (void)suspensionViewClick:(ZYSuspensionView *)suspensionView
{
    NSLog(@"click %@",suspensionView.titleLabel.text);
}

@end
