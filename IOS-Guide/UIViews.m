//
//  UIViews.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "UIViews.h"

@implementation UIViews

CGRect windowRect;

- (void) viewDidLoad {
    [super viewDidLoad];
    windowRect = [[UIScreen mainScreen] bounds];
    // printf("%f %f\n", windowRect.size.width, windowRect.size.width);
    self.mainViewCtrl = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, windowRect.size.width, windowRect.size.height-20-49)];
    self.mainViewCtrl.backgroundColor = [UIColor yellowColor];
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, 0)];
    [self.mainViewCtrl addSubview:self.mainView];
    [self.view addSubview:self.mainViewCtrl];
    [self LabelIntro];
}

- (void) addSubViewToMainView:(UIView*)item {
    CGFloat width = self.mainView.frame.size.width;
    CGFloat height = self.mainView.frame.size.height;
    height = MAX(height, item.frame.size.height + item.frame.origin.y);
//    printf("%f %f %f\n", item.frame.size.height, item.frame.origin.y, height);
    [self.mainView addSubview:item];
    self.mainView.frame = CGRectMake(0, 0, width, height);
    self.mainViewCtrl.contentSize = CGSizeMake(width, height);
}

- (void) LabelIntro {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, windowRect.size.width, 120)];
    [self addSubViewToMainView:label];
    
    label.numberOfLines = 0;
    label.text = @"这是一个Label  灰底白字\n您可以在UIViews.m的LabelIntrol中看到代码\n一行默认大小的字体高度为24\n显示不完会变成省略号\nhahaha\nheheh";
    label.backgroundColor = [UIColor grayColor];
    label.textColor = [UIColor whiteColor];
}

@end
