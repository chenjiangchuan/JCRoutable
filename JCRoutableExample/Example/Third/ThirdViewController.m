//
//  ThirdViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/6/2.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "ThirdViewController.h"
#import "Routable.h"
#import "ViewControllersMapKey.h"

@interface ThirdViewController ()

/** button */
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIButton *blockButton;
@property (strong, nonatomic) UIButton *pushButton;

@end

@implementation ThirdViewController

#pragma mark - Routable Init
//- (id)initWithRouterParams:(NSDictionary *)params {
//    if ((self = [self initWithNibName:nil bundle:nil])) {
//        NSLog(@"%s, params = %@", __FUNCTION__, params);
//    }
//    return self;
//}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.button];
    [self.view addSubview:self.pushButton];
    [self layoutPageSubviews];
    NSLog(@"%s, params = %@", __FUNCTION__, self.routerParams);
}

- (void)layoutPageSubviews {
    [self.button setFrame:CGRectMake(0, 100, self.view.frame.size.width, 50)];
    [self.pushButton setFrame:CGRectMake(0, 160, self.view.frame.size.width, 50)];
}

#pragma mark - Target Action

- (void)buttonClick {
    // 需要逆向传递数据
    if ([self.JCReverseValueDelegate respondsToSelector:@selector(jc_reverseValue:)]) {
        [self.JCReverseValueDelegate jc_reverseValue:@"(delegate) come from ThirdViewController"];
    }
    
    if (self.callBack) {
        self.callBack(@{@"params" : @"(block) come from ThirdViewController"});
    }
}

- (void)pushButtonClick {
    [[Routable sharedRouter] open:FourthViewControllerMapKey
                         animated:YES
                      extraParams:@{@"title" : @"come from ThirdViewController"}
                   delegateObject:nil];
}

#pragma mark - Lazy Initialze
- (UIButton *)button {
    if (_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"逆向传值" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (UIButton *)pushButton {
    if (_pushButton == nil) {
        _pushButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pushButton setTitle:@"跳转到第四个控制器\n（通过jc_mapViewControllerToConfigurePlistFile\n实现从storyboard创建控制器）" forState:UIControlStateNormal];
        _pushButton.titleLabel.numberOfLines = 3;
        _pushButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_pushButton addTarget:self action:@selector(pushButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushButton;
}

@end
