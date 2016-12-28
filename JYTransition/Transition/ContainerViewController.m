//
//  ContainerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/20.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()
@property (nonatomic, copy, readwrite) NSArray<UIViewController *> *viewControllers;
@property (nonatomic, strong) UIView *privateButtonView;
@property (nonatomic, strong) UIView *privateContainerView;
@end

@implementation ContainerViewController
- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers {
    if (self = [super init]) {
        self.viewControllers = [viewControllers copy];
    }
    return self;
}

- (void)loadView {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedViewController = (self.selectedViewController ? : self.viewControllers[0]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UIKit

@end
