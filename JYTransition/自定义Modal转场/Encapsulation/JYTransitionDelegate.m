//
//  JYTransitionDelegate.m
//  VCTransitionDemo
//
//  Created by Jolie_Yang on 2017/1/6.
//  Copyright © 2017年 王 巍. All rights reserved.
//

#import "JYTransitionDelegate.h"
#import "JYAnimationController.h"
#import "JYInteractiveTransition.h"

@interface JYTransitionDelegate ()
@property (nonatomic, strong) JYInteractiveTransition *interactiveTransition;
@end

@implementation JYTransitionDelegate
#pragma mark UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [JYAnimationController new];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [JYAnimationController new];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    if (!self.interactiveTransition) {
        self.interactiveTransition = [JYInteractiveTransition new];
    }
    return self.interactiveTransition.interacting ? self.interactiveTransition : nil;
}
@end
