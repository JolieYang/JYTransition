//
//  SwipePushInteractiveTransition.h
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/25.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwipeNavigationControllerInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
@property (nonatomic, strong) UIViewController *pushToVC;
- (void)pushToViewController:(UIViewController *)vc;
@end
