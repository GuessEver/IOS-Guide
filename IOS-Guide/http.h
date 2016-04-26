//
//  Http.h
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Http : UIViewController

@property (nonatomic, strong) UITextField* urlInputField;
@property (nonatomic, strong) UITextView* requestInputField;
@property (nonatomic, strong) UILabel* content;
@property (nonatomic, strong) UIWebView* contentPreview;

@end
