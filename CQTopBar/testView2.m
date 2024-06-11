//
//  testView2.m
//  CQTopBar
//
//  Created by CQ on 2024/6/7.
//  Copyright © 2024 CQ. All rights reserved.
//

#import "testView2.h"

@implementation testView2

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 200)];
        view.backgroundColor = [UIColor yellowColor];
        [self addSubview:view];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 100)];
        [button setTitle:@"测试" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    return self;
}

- (void)select{
    NSLog(@"测试");
}
@end
