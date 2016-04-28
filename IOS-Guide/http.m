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
    self.urlInputField.text = @"http://acm.uestc.edu.cn/problem/search";
    
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
    self.requestInputField.text = @"{\"currentPage\":\"1\",\"orderAsc\":true,\"orderFields\":\"id\"}";
    
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
    self.content.numberOfLines = 0;
    
}

- (void) getReq {
    NSURL* url = [NSURL URLWithString:self.urlInputField.text];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"GET"];
    
    // GET Request
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSLog(@"data:\n%@\n\n", data);
        NSLog(@"dataString:\n%@\n\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"response:\n%@\n\n", response);
        NSLog(@"error:\n%@\n\n", error);
        
        
        [self.contentPreview loadHTMLString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] baseURL:nil];
    }];
    [task resume];
    
    self.content.text = @"Getting...";
    [self.content sizeToFit];
}

- (void) postReq {
    NSURL* url = [NSURL URLWithString:self.urlInputField.text];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: [self.requestInputField.text dataUsingEncoding:NSUTF8StringEncoding]];
    
    //POST Request
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error) {
        NSLog(@"data:\n%@\n\n", data);
        NSLog(@"dataString:\n%@\n\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"response:\n%@\n\n", response);
        NSLog(@"error:\n%@\n\n", error);
        
        
        [self.contentPreview loadHTMLString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] baseURL:nil];
        //若要引用外部资源，可在baseURL中填写相应网址
        //[self.contentPreview loadHTMLString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] baseURL:[NSURL URLWithString:@"localhost"]];
    }];
    [task resume];
    
    self.content.text = @"Posting...";
    [self.content sizeToFit];
}

@end
