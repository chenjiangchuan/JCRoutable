//
//  AppDelegate.m
//  JCRoutableExample
//
//  Created by chenjiangchuan on 2017/7/21.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "JCLoginViewController.h"
#import "Routable.h"
#import <objc/runtime.h>
#import "FourthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    NSString *str1 = @"xxxStoryboard";
    
    NSRange rang = [str1 rangeOfString:@"Storyboard" options:NSCaseInsensitiveSearch];
    
    if (rang.location != NSNotFound) {
        NSLog(@"rang包含storyboard");
    }
    
    if ([str1 containsString:@"Storyboard"]) {
        NSLog(@"包含Storyboard");
    }
    
    if ([str1 containsString:@"storyboard"]) {
        NSLog(@"包含storyboard");
    }
    
    // 1
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"RoutableConfigure" ofType:@"plist"];
    [Routable jc_mapViewControllerToConfigurePlistFile:plistPath];
//    [[Routable sharedRouter] map:@"FourthViewControllerMapKey" toController:[FourthViewController class] withOptions:nil];
    
    // 2
    BOOL alreadyLogged = [[NSUserDefaults standardUserDefaults] boolForKey:@"kAlreadyLogged"];
    if (!alreadyLogged) {
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[JCLoginViewController alloc] init]];
    } else {
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:[[TabBarController alloc] init]];
        [nc.navigationBar setHidden:YES];
        self.window.rootViewController = nc;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
