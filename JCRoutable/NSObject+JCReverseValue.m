//
//  NSObject+JCReverseValue.m
//
//  Created by chenjiangchuan on 2017/6/7.
//

#import "NSObject+JCReverseValue.h"
#import <objc/runtime.h>

const static void *JCReverseValueDelegateKey = &JCReverseValueDelegateKey;
const static void *JCOpenCallbackKey = &JCOpenCallbackKey;

@implementation NSObject (JCReverseValue)

- (id<JCReverseValueProtocol>)JCReverseValueDelegate {
    return objc_getAssociatedObject(self, JCReverseValueDelegateKey);
}

- (void)setJCReverseValueDelegate:(id<JCReverseValueProtocol>)JCReverseValueDelegate {
    objc_setAssociatedObject(self, JCReverseValueDelegateKey, JCReverseValueDelegate, OBJC_ASSOCIATION_ASSIGN);
}

- (JCOpenCallback)callBack {
    return objc_getAssociatedObject(self, JCOpenCallbackKey);
}

- (void)setCallBack:(JCOpenCallback)callBack {
    objc_setAssociatedObject(self, JCOpenCallbackKey, callBack, OBJC_ASSOCIATION_COPY);
}

@end
