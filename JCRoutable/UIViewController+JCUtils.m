//
//  UIViewController+JCUtils.m
//  SmartCommunity
//
//  Created by chenjiangchuan on 2017/5/17.
//  Copyright © 2017年 Horizontal. All rights reserved.
//

#import "UIViewController+JCUtils.h"

@implementation UIViewController (JCUtils)

#pragma mark -
#pragma mark - Public Methods
+ (UIViewController *)jc_currentViewController {
    // Find best view controller
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController jc_findBestViewController:viewController];
}

#pragma mark -
#pragma mark - Private Methods
+ (UIViewController *)jc_findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [UIViewController jc_findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
            // Return right hand side
            UISplitViewController *svc = (UISplitViewController *)vc;
            if (svc.viewControllers.count > 0)
                return [UIViewController jc_findBestViewController:svc.viewControllers.lastObject];
            else
                return vc;
        }
    else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *svc = (UINavigationController *)vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController jc_findBestViewController:svc.topViewController];
        else
            return vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController*)vc;
        if (svc.viewControllers.count > 0)
            return [UIViewController jc_findBestViewController:svc.selectedViewController];
        else
            return vc;
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

@end
