//
//  JCLoginViewController.m
//  JCRoutable
//
//  Created by chenjiangchuan on 2017/7/21.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "JCLoginViewController.h"
#import "Routable.h"
#import "ViewControllersMapKey.h"
#import "TabBarController.h"

@interface JCLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation JCLoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Event Response

- (IBAction)loginButtonAction:(UIButton *)button {
    NSLog(@"登录成功");
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"kAlreadyLogged"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    // 进入主界面
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:[[TabBarController alloc] init]];
    [nc.navigationBar setHidden:YES];
    // 设置根windows
    self.view.window.rootViewController = nc;
}


@end
