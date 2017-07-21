//
//  NSObject+ReverseValue.h
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/6/7.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCReverseValueProtocol.h"

@interface NSObject (ReverseValue) <JCReverseValueProtocol>

/** ReverseValueProtocol */
@property (weak, nonatomic) id<JCReverseValueProtocol> JCReverseValueDelegate;

@end
