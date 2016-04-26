//
//  Http.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "Http.h"

@implementation Http

extern CGRect windowRect;


- (void) viewDidLoad {
    [super viewDidLoad];
    
    UILabel* urlInputLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 0, 30)];
    [self.view addSubview:urlInputLabel];
    urlInputLabel.text = @"请输入网址";
    [urlInputLabel sizeToFit];
    
    self.urlInputField = [[UITextField alloc] initWithFrame:CGRectMake(0, 50, windowRect.size.width, 30)];
    [self.view addSubview:self.urlInputField];
    self.urlInputField.backgroundColor = [UIColor lightTextColor];
    [self.urlInputField setBorderStyle:UITextBorderStyleRoundedRect];
    self.urlInputField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.urlInputField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    UIButton* submitBtnGET = [[UIButton alloc] initWithFrame:CGRectMake(0, 80, windowRect.size.width, 30)];
    [self.view addSubview:submitBtnGET];
    [submitBtnGET setTitle:@"提交GET请求" forState:UIControlStateNormal];
    [submitBtnGET setBackgroundColor:[UIColor blueColor]];
    [submitBtnGET.layer setCornerRadius:10];
    [submitBtnGET addTarget:self action:@selector(getReq) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel* requestInputLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 120, 0, 30)];
    [self.view addSubview:requestInputLabel];
    requestInputLabel.text = @"请输入Body请求内容（POST）";
    [requestInputLabel sizeToFit];
    
    self.requestInputField = [[UITextView alloc] initWithFrame:CGRectMake(0, 150, windowRect.size.width, 100)];
    [self.view addSubview:self.requestInputField];
    self.requestInputField.backgroundColor = [UIColor lightTextColor];
    self.requestInputField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.requestInputField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    UIButton* submitBtnPOST = [[UIButton alloc] initWithFrame:CGRectMake(0, 260, windowRect.size.width, 30)];
    [self.view addSubview:submitBtnPOST];
    [submitBtnPOST setTitle:@"提交POST请求" forState:UIControlStateNormal];
    [submitBtnPOST setBackgroundColor:[UIColor blueColor]];
    [submitBtnPOST.layer setCornerRadius:10];
    [submitBtnPOST addTarget:self action:@selector(postReq) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.contentPreview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 300, windowRect.size.width, 300)];
    [self.view addSubview:self.contentPreview];
    
    self.content = [[UILabel alloc] initWithFrame:CGRectMake(0, 600, windowRect.size.width, 0)];
    [self.view addSubview:self.content];
    self.content.backgroundColor = [UIColor whiteColor];
    self.content.textColor = [UIColor redColor];
    
}

- (void) getReq {
    NSURL *url = [NSURL URLWithString:self.urlInputField.text];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.contentPreview loadRequest:request];
    self.content.text = @"Geting...";
    [self.content sizeToFit];
}

- (void) postReq {
    self.content.text = @"Posting...";
    [self.content sizeToFit];}

@end
