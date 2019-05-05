//
//  JCView.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/5/27.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "JCView.h"
#import "Routable.h"
#import "ViewControllersMapKey.h"

@interface JCView ()

/** UIButton */
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIButton *blockButton;

@end

@implementation JCView

#pragma mark -
#pragma mark - Initialization Methods
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.button];
        [self addSubview:self.blockButton];
    }
    return self;
}

#pragma mark -
#pragma mark - Private Methods
- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 0.25);
    self.blockButton.frame = CGRectMake(0, self.frame.size.height * 0.25 + 10, self.frame.size.width, self.frame.size.height * 0.25);
}

#pragma mark -
#pragma mark - Event Response
- (void)buttonAction {
    // open: 后面是需要跳转的路由地址，和注册路由时的对应
    // animated: 跳转是否需要动画
    // extraParams: 传过去的参数（正向传值）
    // delegateObject: 设置逆向传值的delegate对象
    [[Routable sharedRouter] open:ThirdViewControllerMapKey
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController"}
                   delegateObject:self];
}

- (void)blockButtonClick {
    [[Routable sharedRouter] open:ThirdViewControllerMapKey
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController"}
                       toCallback:^(NSDictionary *params) {
                           NSLog(@"%s:%@", __FUNCTION__, params);
                       }];
}

#pragma mark -
#pragma mark - JCReverseValueProtocol
// 逆向传过来的值
- (void)jc_reverseValue:(id)value {
    NSLog(@"%s:%@", __FUNCTION__, value);
}

#pragma mark -
#pragma mark - Getters and Setters
- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"push（使用delegate逆向传值）" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIButton *)blockButton {
    if (_blockButton == nil) {
        _blockButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_blockButton setTitle:@"push（使用block逆向传值）" forState:UIControlStateNormal];
        [_blockButton addTarget:self action:@selector(blockButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _blockButton;
}

@end
