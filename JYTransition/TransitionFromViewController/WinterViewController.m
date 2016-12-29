//
//  WinterViewController.m
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/28.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import "WinterViewController.h"
#import "ChildAViewController.h"
#import "ChildBViewController.h"

@interface WinterViewController ()
@property (weak, nonatomic) IBOutlet UIButton *flipFromRightButton;
@end

@implementation WinterViewController {
    UIViewController *_currentVC;
    UIViewController *_fromVC;
    UIViewController *_toVC;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.view bringSubviewToFront:self.flipFromRightButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ChildAViewController *a = [[self storyboard] instantiateViewControllerWithIdentifier:@"ChildAViewController"];
    ChildBViewController *b = [[self storyboard] instantiateViewControllerWithIdentifier:@"ChildBViewController"];
    [self addChildViewController:a];
    [self addChildViewController:b];
    
    [self.view addSubview:a.view];
    _currentVC = a;
    _fromVC = self.childViewControllers[0];
    _toVC = self.childViewControllers[1];
    
}
- (IBAction)FlipFromRightAction:(id)sender {
    [self transitionFromViewController:_currentVC
                      toViewController:self.childViewControllers[1]
                              duration:0.5
                               options:UIViewAnimationOptionTransitionCurlUp
                            animations:^{}
                            completion:^(BOOL finished) {}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
