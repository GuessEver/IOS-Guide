//
//  MainViewController.m
//  IOS-Guide
//
//  Created by Sunnycool on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "MainViewController.h"
#import "UIViews.h"
#import "Http.h"
#import "Gesture.h"
#import "Layout.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.pageTitle = [[NSMutableString alloc] initWithString: @"IOS Guide"];
    [self createTabBars];
    [self createNavigationBars];
}

- (void) createTabBars {
    UIViewController *tab1 = [[UIViews alloc] init];
    tab1.tabBarItem.title = @"UI控件";
    
    UIViewController *tab2 = [[Http alloc] init];
    tab2.tabBarItem.title = @"HTTP请求";
    
    UIViewController *tab3 = [[Gesture alloc] init];
    tab3.tabBarItem.title = @"手势";
    
    UIViewController *tab4 = [[Layout alloc] init];
    tab4.tabBarItem.title = @"排版布局";
    
    UITabBarController *tabs = [[UITabBarController alloc] init];
    tabs.viewControllers = @[tab1, tab2, tab3, tab4];
    tabs.selectedIndex = 0;
    
    [self.view addSubview:tabs.view];
}

- (void) createNavigationBars {
    self.navigationController.view.hidden = YES;
    UINavigationController *navs = [[UINavigationController alloc] init];
    [navs.navigationBar setBarStyle:UIBarStyleDefault];
    [self.view addSubview:navs.view];
}

@end
