//
//  SpringFlowerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "PushFlowerViewController.h"

@interface PushFlowerViewController ()

@end

@implementation PushFlowerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
