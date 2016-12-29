//
//  SpringViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 16/9/19.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

// Note:
// UINavigationController

#import "SpringViewController.h"
#import "PushFlowerViewController.h"
#import "PresentationViewController.h"

@interface SpringViewController ()
@property (weak, nonatomic) IBOutlet UILabel *SpringLB;

@end

@implementation SpringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Action
- (IBAction)jumpAction:(id)sender {
    // m1
//    SpringFlowerViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SpringFlowerViewController"];
//    [self.navigationController pushViewController:vc animated:YES];
    
    // m2 Segue
    [self performSegueWithIdentifier:@"SpringToFlower" sender:nil];
}
- (IBAction)tabBarControllerTransitionAction:(id)sender {
    self.tabBarController.selectedIndex = 1;
}

- (IBAction)presentationAction:(id)sender {
    PresentationViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SummerFlowerViewController"];
    //    [self presentViewController:vc animated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:^{
        // 设置vc界面TF的值，但不是很友好，显示效果为： 切换到vc界面,然后对msgTF文本进行赋值. 查看了下什么时候调用该方法，是在VC界面viewDidAppear后调用该方法.
        vc.msgTF.text = @"hello,Rose";
    }];
}

- (IBAction)ViewControllerUnwindSegue:(UIStoryboardSegue *)unwindSegue {
    PresentationViewController *vc = unwindSegue.sourceViewController;
    if ([unwindSegue.identifier isEqualToString:@"summerFlowerDismiss"]) {
        self.SpringLB.text = vc.msgTF.text;
    };
}

#pragma mark Segue 设置Segue的两种方式: Button To VC; VC to VC;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"SpringToFlower"]) {
        PushFlowerViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SpringFlowerViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
