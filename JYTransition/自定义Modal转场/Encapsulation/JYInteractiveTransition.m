//
//  JYInterfactiveTransition.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/26.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "JYInteractiveTransition.h"

@interface JYInteractiveTransition ()
@property (nonatomic, assign) BOOL shouldComplete;
@property (nonatomic, strong) UIViewController *presentingVC;
@end

@implementation JYInteractiveTransition
- (void)wireToViewController:(UIViewController *)vc {
    self.presentingVC = vc;
    [self addGestureRecognizerInView:vc.view];
}

- (void)addGestureRecognizerInView:(UIView *)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

- (CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view.superview];
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
            self.interacting = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat fraction = translation.x / 400.0;// 设置向右滑动400像素及以上代表100%，translation.x代表向右，translation.y代表向下滑动
            fraction = fminf(fmaxf(fraction, 0.0), 1.0);
            self.shouldComplete = (fraction > 0.5);
            
            [self updateInteractiveTransition:fraction];//  更新百分比
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            self.interacting = NO;
            if (!self.shouldComplete || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}
@end
