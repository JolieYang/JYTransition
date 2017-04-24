//
//  JYAnimationController.m
//  VCTransitionDemo
//
//  Created by Jolie_Yang on 2017/1/6.
//  Copyright © 2017年 王 巍. All rights reserved.
//

#import "JYAnimationController.h"

@implementation JYAnimationController
#pragma mark UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    UIView *containerView = [transitionContext containerView];
   
//    CGRect initialFromVC = [transitionContext initialFrameForViewController:fromVC];
//    CGRect finalFromVC = [transitionContext finalFrameForViewController:fromVC];
//    CGRect initialToVC = [transitionContext initialFrameForViewController:toVC];
    CGRect finalToVC = [transitionContext finalFrameForViewController:toVC];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (toVC.isBeingPresented) {
        [containerView addSubview:toView];
        toView.frame = CGRectOffset(finalToVC, 0, [[UIScreen mainScreen] bounds].size.height/2);
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.frame = finalToVC;
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:YES];
                         }];
    }
    if (fromVC.isBeingDismissed) {
        [containerView addSubview:toView];
        [containerView sendSubviewToBack:toView];
        
        [UIView animateWithDuration:duration
                         animations:^{
                             fromView.bounds = CGRectMake(0, 0, 1, fromView.frame.size.height);
                         } completion:^(BOOL finished) {
                             [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         }];
    }
}

@end
