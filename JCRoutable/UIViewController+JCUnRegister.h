//
//  UIViewController+JCUnRegister.h
//
//  Created by chenjiangchuan on 2017/6/21.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JCUnRegister)

/**
 *  @author chenjiangchuan, 2017-07-21 09:07
 *
 *  注销，回到登录界面
 *
 *  @param loginViewController 登录界面控制器
 *  @param hidden              是否隐藏导航栏
 */
+ (void)jc_unRegisterAccountToLoginViewController:(NSString *)loginViewController
                              hiddenNavigationBar:(BOOL)hidden;

@end
