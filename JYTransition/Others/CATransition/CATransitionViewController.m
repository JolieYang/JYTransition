//
//  AutumnViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "CATransitionViewController.h"
#import "MapleLeafViewController.h"
/* 过渡效果
 kCATransitionFade           //交叉淡化过渡(不支持过渡方向)
 kCATransitionPush           //新视图把旧视图推出去
 kCATransitionMoveIn         //新视图移到旧视图上面
 kCATransitionReveal         //将旧视图移开,显示下面的新视图
 cube           //立方体翻滚效果
 oglFlip        //上下左右翻转效果
 suckEffect     //收缩效果，如一块布被抽走(不支持过渡方向)
 rippleEffect   //滴水效果(不支持过渡方向)
 pageCurl       //向上翻页效果
 pageUnCurl     //向下翻页效果
 cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
 cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
 */

@interface CATransitionViewController ()

@end

@implementation CATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fadeAction:(id)sender {
    [self transitionWithType:kCATransitionFade];
}

- (IBAction)cubeAction:(id)sender {
    [self transitionWithType:@"cube"];
}

- (IBAction)rippleEffectAction:(id)sender {
    [self transitionWithType:@"rippleEffect"];
}
- (IBAction)pageCurlAction:(id)sender {
    [self transitionWithType:@"pageCurl"];
    
}

- (void)transitionWithType:(NSString *)type {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;// 转场动画持续时间
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    if (type == kCATransitionFade || [type isEqualToString: @"suckEffect"] || [type isEqualToString: @"rippleEffect"] || [type isEqualToString: @"cameraIrisHollowOpen"] || [type isEqualToString: @"cameraIrisHollowClose"]) {
        animation.type = type;
    } else {
        animation.type = type;// 动画类型
        animation.subtype = kCATransitionFromRight;// 转场时动画切换的方向
    }
    
    MapleLeafViewController *pop = [[self storyboard] instantiateViewControllerWithIdentifier:@"CATransitionPopViewController"];
    
    // 有导航栏
    [self.navigationController.view.layer addAnimation:animation forKey:@"kTransitionAnimation"];
    [self.navigationController pushViewController:pop animated:NO];
    
    // 无导航栏
    // [Tip]在Window上执行动画，才可在转场时执行动画。在view上执行动画，转场时无法执行
//    [self.view.layer addAnimation:animation forKey:@"Animation"];
//    [self.view.window.layer addAnimation:animation forKey:@"kTansitionAnimation"];
//    [self presentViewController:pop animated:NO completion:nil];// Animated设为NO，只见自定义动画。
}

@end
