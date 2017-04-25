//
//  ChildAViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "ChildAViewController.h"

@interface ChildAViewController ()

@end

@implementation ChildAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
// 翻转
- (IBAction)flipAction:(id)sender {
    [self.parentViewController transitionFromViewController:self toViewController:self.parentViewController.childViewControllers[1] duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
    } completion:^(BOOL finished) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
