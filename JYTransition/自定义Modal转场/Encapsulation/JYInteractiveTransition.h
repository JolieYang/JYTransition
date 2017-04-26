//
//  JYInterfactiveTransition.h
//  JYTransition
//
//  Created by Jolie_Yang on 2017/4/26.
//  Copyright © 2017年 Jolie_Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JYInteractiveTransition :UIPercentDrivenInteractiveTransition
@property (nonatomic, assign) BOOL interacting;
- (void)wireToViewController:(UIViewController *)vc;
@end
