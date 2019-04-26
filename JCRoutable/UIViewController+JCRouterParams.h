//
//  UIViewController+JCRouterParams.h
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/4/26.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JCRouterParams)

/** 上个控制器push时，传递的参数 */
@property (strong, nonatomic) NSDictionary *routerParams;

@end

NS_ASSUME_NONNULL_END
