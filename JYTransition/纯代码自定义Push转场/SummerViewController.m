//
//  SummerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/25.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "SummerViewController.h"
#import "PushViewController.h"
#import "CustomNavigationControllerDelegate.h"

@interface SummerViewController ()

@property (nonatomic, strong) CustomNavigationControllerDelegate *customNavigationControllerDelegate;
@end

@implementation SummerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Action
- (IBAction)pushAction:(id)sender {
    PushViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"PushViewController"];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
