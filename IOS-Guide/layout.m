//
//  Layout.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "Layout.h"

@implementation Layout

NSString* direction;
double width, height;
UILabel* label;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    label = [[UILabel alloc] init];
    [self.view addSubview:label];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadLabel) name:UIDeviceOrientationDidChangeNotification object:nil];
    [self reloadLabel];
}

- (void) reloadLabel {
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    width = windowRect.size.width;
    height = windowRect.size.height;
    if(width < height) direction = @"竖";
    else direction = @"横";
    [label setText:[[NSString alloc] initWithFormat:@"这句话处于屏幕正中间，当前屏幕信息：\n%@, %f * %f", direction, width, height]];
    [label setNumberOfLines:0];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label sizeToFit];
    label.frame = CGRectMake((width - label.frame.size.width) / 2, (height - label.frame.size.height) / 2, label.frame.size.width, label.frame.size.height);
}

@end
