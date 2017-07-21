//
//  JCAppDelegate.m
//  JCRoutable
//
//  Created by chenjiangchuan on 07/21/2017.
//  Copyright (c) 2017 chenjiangchuan. All rights reserved.
//

#import "JCAppDelegate.h"
#import "TabBarController.h"
#import "JCLoginViewController.h"
#import <JCRoutable/Routable.h>

@implementation JCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 1
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"RoutableConfigure" ofType:@"plist"];
    [Routable mapViewControllerToConfigurePlistFile:plistPath];
    
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
