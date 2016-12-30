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
#import "SwipeInteractiveTransition.h"
#import "NormalDismissAnimation.h"

@interface SummerViewController ()<ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) SwipeInteractiveTransition *swipeInteractiveTransition;
@property (nonatomic, strong) NormalDismissAnimation *dismissAniamtion;
@end

@implementation SummerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.presentAnimation = [BouncePresentAnimation new];
    self.swipeInteractiveTransition = [SwipeInteractiveTransition new];
    self.dismissAniamtion = [NormalDismissAnimation new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)modalAction:(id)sender {
    ModalViewController *mvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"ModalViewController"];
    mvc.transitioningDelegate = self;
    mvc.delegate = self;
    [self.swipeInteractiveTransition wireToViewController:mvc];
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

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAniamtion;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.swipeInteractiveTransition.interacting ? self.swipeInteractiveTransition : nil;
}
@end
