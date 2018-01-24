//
//  Text1.m
//  CQTopBar
//
//  Created by yto on 2018/1/22.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "Text1.h"
#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface Text1 ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation Text1

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
//    table.delegate = self;
//    table.dataSource = self;
//    [self.view addSubview:table];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 300)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"Text1Cell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"text%zd",indexPath.row];
    cell.backgroundColor = [UIColor blueColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"====%zd",indexPath.row);
    
}

@end
