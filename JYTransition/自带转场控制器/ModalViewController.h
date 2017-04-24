//
//  ModalViewController.h
//  JYTransition
//
//  Created by Jolie_Yang on 2016/12/29.
//  Copyright © 2016年 Jolie_Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ModalViewController;
@protocol ModalViewControllerDelegate <NSObject>
- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)vc;
@end

@interface ModalViewController : UIViewController
@property (nonatomic, strong) id<ModalViewControllerDelegate> delegate;
@end
