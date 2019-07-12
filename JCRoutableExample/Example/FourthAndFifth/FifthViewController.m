//
//  FifthViewController.m
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/5/5.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import "FifthViewController.h"
#import "Routable.h"
#import "ViewControllersMapKey.h"

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

#pragma mark -
#pragma mark - Event Response

- (IBAction)buttonAction:(UIButton *)sender {
    [[Routable sharedRouter] open:SixthViewControllerMapKey animated:YES];
//    UIViewController *vc = [[UIViewController alloc] initWithNibName:@"SixthViewController" bundle:nil];
//    UIViewController *vc = [[UIViewController alloc] init];
//    [[Routable sharedRouter].navigationController pushViewController:vc animated:YES];
}

@end
