//
//  ViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

// Note:
// Modal Transition

#import "SummerViewController.h"
#import "SummerFlowerViewController.h"

@interface SummerViewController ()

@property (weak, nonatomic) IBOutlet UILabel *summerLB;
@end

@implementation SummerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Action
// Modal 转场
- (IBAction)jumpAction:(id)sender {
    SummerFlowerViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SummerFlowerViewController"];
//    [self presentViewController:vc animated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:^{
        // 设置vc界面TF的值，但不是很友好，显示效果为： 切换到vc界面,然后对msgTF文本进行赋值. 查看了下什么时候调用该方法，是在VC界面viewDidAppear后调用该方法.
        vc.msgTF.text = @"hello,Rose";
    }];
}

- (IBAction)ViewControllerUnwindSegue:(UIStoryboardSegue *)unwindSegue {
    SummerFlowerViewController *vc = unwindSegue.sourceViewController;
    if ([unwindSegue.identifier isEqualToString:@"summerFlowerDismiss"]) {
        self.summerLB.text = vc.msgTF.text;
//        self.summerLB.text = @"从flower回来";
    };
}
@end
