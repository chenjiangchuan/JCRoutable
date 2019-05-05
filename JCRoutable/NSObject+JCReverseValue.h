//
//  NSObject+JCReverseValue.h
//
//  Created by chenjiangchuan on 2017/6/7.
//

#import <Foundation/Foundation.h>
#import "JCReverseValueProtocol.h"

typedef void (^JCOpenCallback)(NSDictionary *params);

@interface NSObject (JCReverseValue) <JCReverseValueProtocol>

/** ReverseValueProtocol */
@property (weak, nonatomic) id<JCReverseValueProtocol> JCReverseValueDelegate;
/** CallBack */
@property (copy, nonatomic) JCOpenCallback callBack;

@end
