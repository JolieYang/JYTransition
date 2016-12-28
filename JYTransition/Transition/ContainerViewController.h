//
//  ContainerViewController.h
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/20.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

// 参考UINavigationController.h 中
// @protocol UINavigationControllerDelegate
// @interface UINavigationController: UIViewController

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ContainerViewControllerOperation) {
    ContainerViewControllerOperationLeft = 0,
    ContainerViewControllerOperationRight = 1
};

@protocol ContainerViewControllerDelegate;

@interface ContainerViewController : UIViewController
- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)viewControllers;


@property (nonatomic, weak) id<ContainerViewControllerDelegate> delegate;
@property (nonatomic, readonly) UIGestureRecognizer *interactivePopGestureRecognizer;
@property (nonatomic, copy, readonly) NSArray<UIViewController *> *viewControllers;

@property (nonatomic, strong) UIViewController *selectedViewController;

@end

@protocol ContainerViewControllerDelegate <NSObject>

@optional
- (id<UIViewControllerAnimatedTransitioning>)containerViewController:(ContainerViewController *)containerViewController animationControllerFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

- (id<UIViewControllerAnimatedTransitioning>)containerViewController:(ContainerViewController *)containerViewController animationControllerForOperation:(ContainerViewControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;
@end
