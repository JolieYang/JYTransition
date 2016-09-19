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
#import "SpringFlowerViewController.h"

@interface SpringViewController ()

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

#pragma mark Segue 设置Segue的两种方式: Button To VC; VC to VC;
- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"SpringToFlower"]) {
        SpringFlowerViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier:@"SpringFlowerViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
