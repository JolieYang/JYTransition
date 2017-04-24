//
//  SummerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/29.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "SummerViewController.h"
#import "ModalViewController.h"
#import "JYTransitionDelegate.h"

@interface SummerViewController ()<ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) JYTransitionDelegate *encapsulationTransitionDelegate;
@end

@implementation SummerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.encapsulationTransitionDelegate = [JYTransitionDelegate new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)encapsulationModelAction:(id)sender {
    ModalViewController *mvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ModalViewController"];
    mvc.transitioningDelegate = self.encapsulationTransitionDelegate;
    mvc.delegate = self;
    [self presentViewController:mvc animated:YES completion:nil];
}

#pragma mark ModalViewControllerDelegate
- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)vc {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
