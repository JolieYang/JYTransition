//
//  CustomNavigationController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/25.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "CustomNavigationController.h"
#import "PageNavigationControllerDelegate.h"
#import "CustomNavigationControllerDelegate.h"

@interface CustomNavigationController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) PageNavigationControllerDelegate *pageNavigationControllerDelegate;
@property (nonatomic, strong) CustomNavigationControllerDelegate *customNavigationControllerDelegate;
@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.pageNavigationControllerDelegate = [PageNavigationControllerDelegate new];
//    self.delegate = self.pageNavigationControllerDelegate;
    
    self.customNavigationControllerDelegate = [CustomNavigationControllerDelegate new];
    self.delegate = self.customNavigationControllerDelegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
