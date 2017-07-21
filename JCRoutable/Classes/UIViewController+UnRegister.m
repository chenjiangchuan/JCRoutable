//
//  UIViewController+UnRegister.m
//  AppFrameworkDemo
//
//  Created by chenjiangchuan on 2017/6/21.
//  Copyright © 2017年 Hori-GZ. All rights reserved.
//

#import "UIViewController+UnRegister.h"

@implementation UIViewController (UnRegister)

+ (void)unRegisterAccountToLoginViewController:(NSString *)loginViewController {
    if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *rootNV = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        // 获取navigation的子控制器
        NSMutableArray *navMArray = [rootNV.childViewControllers mutableCopy];
//        NSLog(@"navMArray = %@", navMArray);
        NSMutableArray *mArray = [NSMutableArray array];
        
        NSUInteger loginIndex = 100;
        for (NSUInteger index = 0; index < navMArray.count; index++) {
            UIViewController *viewController = navMArray[index];
            if ([viewController isKindOfClass:NSClassFromString(loginViewController)]) {
                loginIndex = index;
            }
        }
        
        if ((loginIndex <= navMArray.count - 1) && loginIndex > 0) {
            for (NSInteger index = loginIndex-1; index >= 0; index--) {
                [mArray addObject:navMArray[index]];
            }
            [navMArray removeObjectsInArray:mArray];
            [[UIApplication sharedApplication].keyWindow.rootViewController setValue:navMArray forKey:@"childViewControllers"];
            [(UINavigationController *)([UIApplication sharedApplication].keyWindow.rootViewController) popToRootViewControllerAnimated:YES];
        } else if (loginIndex == 0) {
            [(UINavigationController *)([UIApplication sharedApplication].keyWindow.rootViewController) popToRootViewControllerAnimated:YES];
        } else {
            Class viewControllerClass = NSClassFromString(loginViewController);
            UIViewController *loginVC = [[viewControllerClass alloc] init];
            [navMArray removeAllObjects];
            [[UIApplication sharedApplication].keyWindow.rootViewController setValue:navMArray forKey:@"childViewControllers"];
            [UIApplication sharedApplication].keyWindow.rootViewController = nil;
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginVC];
            [nc.navigationBar setHidden:YES];
            [UIApplication sharedApplication].keyWindow.rootViewController = nc;
        }
    }
}

@end
