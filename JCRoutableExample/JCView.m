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

@end

@implementation JCView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.button];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.button.frame = self.bounds;
}

- (void)buttonAction {
    [[Routable sharedRouter] open:ThirdViewControllerMapKey
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController"}
                   delegateObject:self];
}

- (void)jc_reverseValue:(id)value {
    NSLog(@"%s:%@", __FUNCTION__, value);
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"clickMe" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

@end
