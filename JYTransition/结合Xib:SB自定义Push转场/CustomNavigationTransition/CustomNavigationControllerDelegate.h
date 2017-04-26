//
//  CustomNavigationControllerDelegate.h
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/30.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigationControllerDelegate : NSObject<UINavigationControllerDelegate>
// 1) 绑定导航栏控制器; 2)在Storyboard中设置导航栏控制器的代理，即拖拉导航栏控制器到CustomNavigationControllerDelegate处绑定代理
@property (weak, nonatomic) IBOutlet UINavigationController *navigationController;
@end
