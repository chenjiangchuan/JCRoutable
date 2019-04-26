//
//  UIViewController+JCRouterParams.m
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/4/26.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import "UIViewController+JCRouterParams.h"
#import <objc/runtime.h>

const static void *routerParamsKey = &routerParamsKey;

@implementation UIViewController (JCRouterParams)

- (NSDictionary *)routerParams {
    return objc_getAssociatedObject(self, routerParamsKey);
}

- (void)setRouterParams:(NSDictionary *)routerParams {
    objc_setAssociatedObject(self, routerParamsKey, routerParams, OBJC_ASSOCIATION_RETAIN);
}

@end
