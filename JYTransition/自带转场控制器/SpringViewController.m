//
//  SpringViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

// Note:
// UINavigationController

#import "SpringViewController.h"
#import "ModalViewController.h"
#import "BouncePresentAnimation.h"
#import "SwipeInteractiveTransition.h"
#import "NormalDismissAnimation.h"

@interface SpringViewController ()<ModalViewControllerDelegate, UIViewControllerTransitioningDelegate>
@property (weak, nonatomic) IBOutlet UILabel *SpringLB;
@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;
@property (nonatomic, strong) SwipeInteractiveTransition *swipeInteractiveTransition;
@property (nonatomic, strong) NormalDismissAnimation *dismissAniamtion;
@end

@implementation SpringViewController

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
#pragma mark Action
- (IBAction)presentationAction:(id)sender {
//    PresentationViewController *mvc = [[self storyboard] instantiateViewControllerWithIdentifier:@"PresentationViewController"];
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
