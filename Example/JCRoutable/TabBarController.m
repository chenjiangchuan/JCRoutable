//
//  TableViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/6/1.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "TabBarController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        NSLog(@"%s, %@", __FUNCTION__, params[@"title"]);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController *vc = [[ViewController alloc] init];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    UINavigationController *vcNc = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *secondVcNc = [[UINavigationController alloc] initWithRootViewController:secondVC];
    
    vcNc.tabBarItem.title = @"first";
    secondVcNc.tabBarItem.title = @"second";
    
    NSArray *array = @[vcNc, secondVcNc];
    self.viewControllers = array;
}

@end
