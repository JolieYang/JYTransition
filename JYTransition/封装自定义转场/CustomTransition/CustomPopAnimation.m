//
//  CustomPopAnimation.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/30.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "CustomPopAnimation.h"

@implementation CustomPopAnimation
#pragma mark UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    toVC.view.alpha = 0;
//    [containerView sendSubviewToBack:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
//                         fromVC.view.bounds = CGRectMake(0, 0, 1, fromVC.view.frame.size.height);
                         fromVC.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
                         toVC.view.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         fromVC.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                     }];
    
}
@end
