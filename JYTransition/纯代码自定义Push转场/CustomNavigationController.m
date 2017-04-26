//
//  CustomNavigationController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/25.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import "CustomNavigationController.h"
#import "PagePushAnimation.h"
#import "PagePopAnimation.h"
#import "SwipeNavigationControllerInteractiveTransition.h"

@interface CustomNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong) SwipeNavigationControllerInteractiveTransition *swipeInteractiveTransition;
@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.swipeInteractiveTransition = [SwipeNavigationControllerInteractiveTransition new];
    self.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        [self.swipeInteractiveTransition pushToViewController:toVC];
        return [PagePushAnimation new];
    }
    else if(operation == UINavigationControllerOperationPop)
    {
        return [PagePopAnimation new];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.swipeInteractiveTransition.interacting ? self.swipeInteractiveTransition:nil;// 当Push时interacting为NO，则使用默认的转场交互
}

@end
