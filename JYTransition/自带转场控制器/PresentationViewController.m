//
//  SummerFlowerViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "PresentationViewController.h"
#import "SummerTreeViewController.h"

@interface PresentationViewController ()

@end

@implementation PresentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.msgTF.text = @"rose";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissAction:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self performSegueWithIdentifier:@"summerFlowerDismiss" sender:sender];
}

// Modal 转场
- (IBAction)modalAction:(id)sender {
    [self performSegueWithIdentifier:@"ModalTransition" sender:sender];
}



//- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    NSLog(@"perform");
//    [super performSegueWithIdentifier:identifier sender:sender];
//    if ([identifier isEqualToString:@"ModalTransition"]) {
//        NSLog(@"perform2");
//        
//    }
//}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(nullable id)sender {
    NSLog(@"should");
    if ([identifier isEqualToString:@"ModalTransition"]) {
        return YES;
    } else {
        return NO;
    }
}
// 转场前修改参数,eg: 传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepare");
    if ([segue.identifier isEqualToString:@"ModalTransition"]) {
        SummerTreeViewController *destinationVC = segue.destinationViewController;
        // 获取destinationVC,可传递参数
        destinationVC.msg = [NSString stringWithFormat:@"Message:%@", self.msgTF.text];
        // sender 通过判断是哪一个sender，做相应的操作
    }
}
@end
