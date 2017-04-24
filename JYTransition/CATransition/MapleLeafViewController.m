//
//  CATransitionPopViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "MapleLeafViewController.h"

@interface MapleLeafViewController ()

@end

@implementation MapleLeafViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)popAction:(id)sender {
    // 1.有导航栏
    [self.navigationController popViewControllerAnimated:YES];
    // 无导航栏
//    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
