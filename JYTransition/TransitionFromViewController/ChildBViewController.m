//
//  ChildBViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "ChildBViewController.h"

@interface ChildBViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation ChildBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender {
    [self.parentViewController transitionFromViewController:self toViewController:self.parentViewController.childViewControllers[0] duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
    } completion:^(BOOL finished) {
        
    }];
}


@end
