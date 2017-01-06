//
//  JYTransitionDelegate.m
//  VCTransitionDemo
//
//  Created by Jolie_Yang on 2017/1/6.
//  Copyright © 2017年 王 巍. All rights reserved.
//

#import "JYTransitionDelegate.h"
#import "JYAnimationController.h"
#import "BouncePresentAnimation.h"
#import "NormalDismissAnimation.h"
#import "SwipeInteractiveTransition.h"

@implementation JYTransitionDelegate
#pragma mark UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
//    return [BouncePresentAnimation new];
    return [JYAnimationController new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
//    return [NormalDismissAnimation new];
    return [JYAnimationController new];
}
@end
