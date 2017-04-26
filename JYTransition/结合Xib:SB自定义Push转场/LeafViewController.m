//
//  LeafViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/26.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "LeafViewController.h"

@interface LeafViewController ()

@end

@implementation LeafViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backItemAction)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backItemAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
