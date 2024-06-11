//
//  ViewController.m
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQTopBarView.h"
#import "testView1.h"
#import "testView2.h"
#import "testView3.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) CQTopBarView *topBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    testView1 *test1 = [[testView1 alloc] init];
    
    testView2 *test2 = [[testView2 alloc] init];
    
    testView3 *test3 = [[testView3 alloc] init];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    CGRect topBarFrame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, 40);
    CQTopBarView *topBar = [[CQTopBarView alloc] initWithFrame:topBarFrame
                                                   ContentView:tableView
                                                 SectionTitles:@[@"test1",@"test2",@"test3"]
                                                     PageViews:@[test1,test2,test3]];
    
    topBar.segmentbackImage = [UIImage imageNamed:@"userorder_cancelbtn_highlight"];
    topBar.selectSegmentbackImage = [UIImage imageNamed:@"main_searchbutton_normal"];
    topBar.segmentlineColor = [UIColor whiteColor];
    [self.view addSubview:topBar];
    
    [test1 setTitleLabel:^(NSString * _Nonnull str) {
        NSLog(@"test1=====%@",str);
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"TableViewCell";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"TableViewCell";
    return cell;
}


@end
