//
//  FourthViewController.m
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/4/26.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import "FourthViewController.h"
#import "Routable.h"
#import "ViewControllersMapKey.h"

@interface FourthViewController ()

/** 跳转到第五个控制器 */
@property (strong, nonatomic) UIButton *jumpFifthVCButton;

@end

@implementation FourthViewController
// 这里不需要实现 + allocWithRouterParams方法，因为在RoutableConfigure.plist已经配置过了

#pragma mark -
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"打印上个控制器传过来的参数：%s, params = %@", __FUNCTION__, self.routerParams);
    
    [self.view addSubview:self.jumpFifthVCButton];
    [self layoutSubViews];
}

#pragma mark -
#pragma mark - Private Methods
- (void)layoutSubViews {
    self.jumpFifthVCButton.frame = CGRectMake(0, 150, self.view.frame.size.width, 50);
}

#pragma mark -
#pragma mark - Event Response
- (void)jumpFifthVCButtonAction {
    [[Routable sharedRouter] open:FifthViewControllerMapKey animated:YES extraParams:@{@"id" : @"第四个控制器传过来的参数"}];
}

#pragma mark -
#pragma mark - Getters and Setters
- (UIButton *)jumpFifthVCButton {
    if (!_jumpFifthVCButton) {
        _jumpFifthVCButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_jumpFifthVCButton setTitle:@"跳转到第五个控制器\n（通过+ allocWithRouterParams实现从storyboard创建控制器）" forState:UIControlStateNormal];
        _jumpFifthVCButton.titleLabel.numberOfLines = 3;
        _jumpFifthVCButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_jumpFifthVCButton addTarget:self action:@selector(jumpFifthVCButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpFifthVCButton;
}

@end
