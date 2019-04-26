//
//  FourthViewController.m
//  JCRoutableExample
//
//  Created by 陈江川 on 2019/4/26.
//  Copyright © 2019 chenjiangchuan. All rights reserved.
//

#import "FourthViewController.h"
#import "Routable.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

#pragma mark -
#pragma mark - Initialization Methods
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"ViewController -- initWithCoder");
    self = [super initWithCoder:aDecoder];
    if (self ) {
        
    }
    return self;
}

#pragma mark -
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s, params = %@", __FUNCTION__, self.routerParams);
}

@end
