//
//  PushViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/25.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backItemAction)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- Action
- (IBAction)backAction:(id)sender {
    [self backItemAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
