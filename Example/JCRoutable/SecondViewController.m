//
//  SecondViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "SecondViewController.h"
#import <JCRoutable/Routable.h>

@interface SecondViewController () 

/** logoutButton */
@property (strong, nonatomic) UIButton *logoutButton;

@end

@implementation SecondViewController

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        NSLog(@"%s, %@", __FUNCTION__, params[@"title"]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.logoutButton];
    self.navigationItem.title = @"第二个控制器";
    [self layoutPageSubviews];
}

- (void)layoutPageSubviews {
    self.logoutButton.frame = CGRectMake(100, 100, 80, 30);
}

#pragma mark - Event Response

- (void)logoutButtonAction {
    NSLog(@"%s", __FUNCTION__);
    // 注销，回到登录界面
    [Routable unRegisterAccountToLoginViewController:@"JCLoginViewController"];
}

#pragma mark - Lazy Initialze

- (UIButton *)logoutButton {
    if (_logoutButton == nil) {
        _logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_logoutButton setTitle:@"注销" forState:UIControlStateNormal];
        [_logoutButton addTarget:self action:@selector(logoutButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutButton;
}

@end
