//
//  SwipeInteractiveTransition.h
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/30.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwipeInteractiveTransition : UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController *)vc;
@end
