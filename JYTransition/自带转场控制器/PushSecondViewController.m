//
//  SpringTreeViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "PushSecondViewController.h"

@interface PushSecondViewController ()

@end

@implementation PushSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popToRootAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
