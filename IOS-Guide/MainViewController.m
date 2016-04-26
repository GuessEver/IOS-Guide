//
//  MainViewController.m
//  IOS-Guide
//
//  Created by GuessEver on 16/4/25.
//  Copyright © 2016年 GuessEver. All rights reserved.
//

#import "MainViewController.h"
#import "GlobalVariables.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTabBars];
    
}

- (void) createTabBars {
    UIViews *tab1 = [[UIViews alloc] init];
    tab1.tabBarItem.title = @"UI控件";
    tab1.tabBarItem.image = [UIImage imageNamed:@"uiviews-ico"];
    
    UIViewController *tab2 = [[Http alloc] init];
    tab2.tabBarItem.title = @"HTTP请求";
    tab2.tabBarItem.image = [UIImage imageNamed:@"http-ico"];
    
    UIViewController *tab3 = [[Gesture alloc] init];
    tab3.tabBarItem.title = @"手势";
    tab3.tabBarItem.image = [UIImage imageNamed:@"gesture-ico"];
    
    UIViewController *tab4 = [[Layout alloc] init];
    tab4.tabBarItem.title = @"排版布局";
    tab4.tabBarItem.image = [UIImage imageNamed:@"layout-ico"];
    
    self.tabs = [[UITabBarController alloc] init];
    self.tabs.viewControllers = @[tab1, tab2, tab3, tab4];
    self.tabs.selectedIndex = 0;
    
    [self.view addSubview:self.tabs.view];
}

@end
