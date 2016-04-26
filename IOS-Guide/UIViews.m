//
//  UIViews.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "UIViews.h"

@implementation UIViews

extern CGRect windowRect;

- (void) viewDidLoad {
    [super viewDidLoad];
    // 获取窗体Rect
    windowRect = [[UIScreen mainScreen] bounds];
    // printf("%f %f\n", windowRect.size.width, windowRect.size.width);
    self.mainViewCtrl = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, windowRect.size.width, windowRect.size.height-20-49)];
    self.mainViewCtrl.backgroundColor = [UIColor yellowColor];
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, 0)];
    [self.mainViewCtrl addSubview:self.mainView];
    [self.view addSubview:self.mainViewCtrl];

    [self LabelIntro];
    [self TextViewIntro];
    [self TextFieldIntro];
    [self ButtonIntro];
    [self WebViewIntro];
}

- (void) addSubViewToMainView:(UIView*)item {
    // self.mainViewCtrl(UIScrollView).contentSize需手动设置，用该函数调整
    CGFloat width = self.mainView.frame.size.width;
    CGFloat height = self.mainView.frame.size.height;
    height = MAX(height, item.frame.size.height + item.frame.origin.y);
//    printf("%f %f %f\n", item.frame.size.height, item.frame.origin.y, height);
    [self.mainView addSubview:item];
    self.mainView.frame = CGRectMake(0, 0, width, height);
    self.mainViewCtrl.contentSize = CGSizeMake(width, height);
}

- (void) LabelIntro {
    UILabel *scrollIntro = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, 48)];
    [self addSubViewToMainView:scrollIntro];
    scrollIntro.numberOfLines = 0;
    scrollIntro.text = @"该页面框架为UIScrollView\n页面切换由UITabBarController实现";
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 48, windowRect.size.width, 120)];
    [self addSubViewToMainView:label];
    
    label.numberOfLines = 0;
    label.text = @"这是一个Label  灰底白字\n您可以在UIViews.m的LabelIntrol中看到代码\n一行默认大小的字体高度为24\n显示不完会变成省略号\nhahaha\nheheh";
    label.backgroundColor = [UIColor grayColor];
    label.textColor = [UIColor whiteColor];
}

- (void) TextViewIntro {
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 200, windowRect.size.width, 80)];
    [self addSubViewToMainView:textView];
    textView.text = @"这是TextView，可以多行";
    textView.textColor = [UIColor redColor];
    textView.backgroundColor = [UIColor whiteColor];
    textView.textAlignment = NSTextAlignmentCenter;
    textView.autocorrectionType = UITextAutocorrectionTypeNo;
}

- (void) TextFieldIntro {
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 300, windowRect.size.width, 80)];
    textField.text = @"这是TextView，只能一行";
    textField.backgroundColor = [UIColor grayColor];
    [self addSubViewToMainView:textField];
}

- (void) ButtonIntro {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 400, 100, 30);
    [self addSubViewToMainView:button];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"这是一个按钮" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
}

- (void) WebViewIntro {
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 500, windowRect.size.width, 500)];
    [self addSubViewToMainView:webView];
    webView.scalesPageToFit = YES;
    NSURL* url = [NSURL URLWithString:@"http://baidu.com"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

@end
