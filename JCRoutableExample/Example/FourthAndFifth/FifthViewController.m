//
//  FifthViewController.m
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/5/5.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

#pragma mark -
#pragma mark - Routable Init
+ (id)allocWithRouterParams:(NSDictionary *)params {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"home" bundle:nil];
    FifthViewController *instance = [storyboard instantiateViewControllerWithIdentifier:@"FifthViewController"];
    NSLog(@"%s\nid = %@", __func__, [params objectForKey:@"id"]);

    return instance;
}

#pragma mark -
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
