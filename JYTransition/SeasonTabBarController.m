//
//  SeasonViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//


// Note:
// UITabBarController

#import "SeasonTabBarController.h"
#import "SpringViewController.h"
#import "WinterViewController.h"

@interface SeasonTabBarController ()

@end

@implementation SeasonTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.tabBarController.selectedIndex = 1;
//    SummerFlowerViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SummerFlowerViewController"];
//    [self.tabBarController setSelectedViewController:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
