//
//  AutumnViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "AutumnViewController.h"
#import "CATransitionPopViewController.h"

@interface AutumnViewController ()

@end

@implementation AutumnViewController

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

- (IBAction)pushAction:(id)sender {
    [self transitionWithType:kCATransitionPush];
}

- (IBAction)moveInAction:(id)sender {
    [self transitionWithType:kCATransitionMoveIn];
}
- (IBAction)revealAction:(id)sender {
    [self transitionWithType:kCATransitionReveal];
    
}

- (void)transitionWithType:(NSString *)type {
    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    animation.type = type;
    animation.subtype = kCATransitionFromRight;
    
    CATransitionPopViewController *pop = [[self storyboard] instantiateViewControllerWithIdentifier:@"CATransitionPopViewController"];
    
    // 有导航栏
//    [self.navigationController.view.layer addAnimation:animation forKey:@"kTransitionAnimation"];
//    [self.navigationController pushViewController:pop animated:YES];
    
    // 无导航栏
    [self.view.window.layer addAnimation:animation forKey:@"kTansitionAnimation"];
    [self presentViewController:pop animated:YES completion:nil];
}

@end
