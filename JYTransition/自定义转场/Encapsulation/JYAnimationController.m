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
    // 转场发生的容器, A --> B 时则需在containerView中添加B视图
    UIView *containerView = [transitionContext containerView];
   
    CGRect finalToVC = [transitionContext finalFrameForViewController:toVC];// toVC切换结束后的frame
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // A(fromVC) --> B(toVC) 调用presentViewController 因而B的isBeingPresented为YES
    if (toVC.isBeingPresented) {
        [containerView addSubview:toView];// 必须将toView添加到containerView容器中，否则黑屏(containerView的背景颜色默认为黑色)。
        toView.frame = CGRectOffset(finalToVC, 0, [[UIScreen mainScreen] bounds].size.height/2);// 偏移为Y值，因而B将从底下弹起，可以根据offset修改谈起的方向 finalToVC为最后的frame，{0,0,kAppWidth,kAppHeight}
        [UIView animateWithDuration:duration
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0.5
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             toView.frame = finalToVC;
                         } completion:^(BOOL finished) {
                             //动画完成或者取消之后必须得调用的方法，系统接收到这个消息后将对控制器的状态进行维护，参数为向这个context报告切换是否完成
                             [transitionContext completeTransition:YES];
                         }];
    }
    // B(fromVC) --> A(toVC) B调用了dismissViewControllerAnimated:completion 因而B的isBeingDismissed为YES
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
