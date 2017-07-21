//
//  NSObject+ReverseValue.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/6/7.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "NSObject+ReverseValue.h"
#import <objc/runtime.h>

const static void *JCReverseValueDelegateKey = &JCReverseValueDelegateKey;

@implementation NSObject (ReverseValue)

- (id<JCReverseValueProtocol>)JCReverseValueDelegate {
    return objc_getAssociatedObject(self, JCReverseValueDelegateKey);
}

- (void)setJCReverseValueDelegate:(id<JCReverseValueProtocol>)JCReverseValueDelegate {
    objc_setAssociatedObject(self, JCReverseValueDelegateKey, JCReverseValueDelegate, OBJC_ASSOCIATION_ASSIGN);
}

@end
