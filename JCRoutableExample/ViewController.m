//
//  ViewController.m
//  RoutableDemo
//
//  Created by chenjiangchuan on 2017/2/17.
//  Copyright © 2017年 chenjiangchuan. All rights reserved.
//

#import "ViewController.h"
#import "Routable.h"
#import "JCView.h"

@interface ViewController ()

/** button */
@property (strong, nonatomic) UIButton *button;
/** JCView */
@property (strong, nonatomic) JCView *jcView;

@end

@implementation ViewController

#pragma mark - Routable Init

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        NSLog(@"%s, params = %@", __FUNCTION__, params);
    }
    return self;
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"第一个控制器";

    [self.view setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:self.jcView];
    self.jcView.frame = CGRectMake(50, 100, 300, 50);
}

#pragma mark - ReverseValueProtocol

- (void)jc_reverseValue:(id)value {
    NSLog(@"%s:%@", __FUNCTION__, value);
}

#pragma mark - Lazy Initialze

- (JCView *)jcView {
    if (_jcView == nil) {
        _jcView = [[JCView alloc] init];
    }
    return _jcView;
}

@end
