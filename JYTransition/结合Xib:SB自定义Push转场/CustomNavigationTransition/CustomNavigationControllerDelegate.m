//
//  CustomNavigationControllerDelegate.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/30.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "CustomNavigationControllerDelegate.h"
#import "CustomPopAnimation.h"

@interface CustomNavigationControllerDelegate ()

@property (nonatomic, strong) CustomPopAnimation *animation;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;
@end

@implementation CustomNavigationControllerDelegate

- (void)awakeFromNib {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navigationController.view addGestureRecognizer:pan];
    
    self.animation = [CustomPopAnimation new];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    UIView *view = self.navigationController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) {
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        // 当切换完成或者取消的时候，把interaction controller设为nil。因为如果下一次的转场是非交互的， 我们不应该返回这个旧的 interaction controller。
        self.interactionController = nil;
    }
}

#pragma mark UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    // 非交互的转场中，则返回nil
    return self.interactionController;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                            toViewController:(UIViewController *)toVC {
    // operation 分为Push, Pop, None 通过不同的operation返回不同的动画
    if (operation == UINavigationControllerOperationPop) {
        return self.animation;
    }
    return nil;
}
@end
