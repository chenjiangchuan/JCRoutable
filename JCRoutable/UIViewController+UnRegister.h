//
//  UIViewController+UnRegister.h
//  AppFrameworkDemo
//
//  Created by chenjiangchuan on 2017/6/21.
//  Copyright © 2017年 Hori-GZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (UnRegister)

/**
 *  @author chenjiangchuan, 2017-07-21 09:07
 *
 *  注销，回到登录界面
 *
 *  @param loginViewController 登录界面控制器
 *  @param hidden              是否隐藏导航栏
 */
+ (void)unRegisterAccountToLoginViewController:(NSString *)loginViewController
                           hiddenNavigationBar:(BOOL)hidden;

@end
