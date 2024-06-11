//
//  testView3.m
//  CQTopBar
//
//  Created by CQ on 2024/6/7.
//  Copyright © 2024 CQ. All rights reserved.
//

#import "testView3.h"
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface testView3 ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation testView3

- (instancetype)init{
    self = [super init];
    if (self) {
        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
        table.delegate = self;
        table.dataSource = self;
        [self addSubview:table];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"testView1Cell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [NSString stringWithFormat:@"testView%zd",indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"test3View%zd",indexPath.row];
    NSLog(@"testView3 = %@", str);
}

@end
