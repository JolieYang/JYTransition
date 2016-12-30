//
//  SummerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/29.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "SummerViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"

@interface SummerViewController ()<ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@end

@implementation SummerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.presentAnimation = [BouncePresentAnimation new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)modalAction:(id)sender {
    ModalViewController *mvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ModalViewController"];
    mvc.transitioningDelegate = self;
    mvc.delegate = self;
    [self presentViewController:mvc animated:YES completion:nil];
}

#pragma mark ModalViewControllerDelegate
- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)vc {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UIViewControllerTransitioningDelegate
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}
@end
