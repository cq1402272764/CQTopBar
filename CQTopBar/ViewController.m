//
//  ViewController.m
//  CQTopBar
//
//  Created by yto on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "ViewController.h"
#import "CQTopBarViewController.h"
#import "Text1.h"
#import "Text2.h"
#import "Text3.h"

@interface ViewController ()
@property (nonatomic, strong) CQTopBarViewController *topBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction2:) name:@"123" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(InfoNotificationAction3:) name:@"qwe" object:nil];
    self.topBar = [[CQTopBarViewController alloc] init];
    self.topBar.sectionTitles = @[@"Text1",@"Text2",@"Text3"];
    self.topBar.pageViewClasses = @[[Text1 class],[Text2 class],[Text3 class]];
    [self addChildViewController:self.topBar];
    [self.view addSubview:self.topBar.view];

}

- (void)InfoNotificationAction2:(NSNotification *)notification{
    [self.topBar topBarReplaceObjectsAtIndexes:1 withObjects:notification.object];
}

- (void)InfoNotificationAction3:(NSNotification *)notification{
    [self.topBar topBarReplaceObjectsAtIndexes:2 withObjects:notification.object];
}

- (void)text{
    self.topBar = [[CQTopBarViewController alloc] init];
    self.topBar.sectionTitles = @[@"Text1",@"Text2",@"Text3"];
    self.topBar.pageViewClasses = @[[Text1 class],[Text2 class],[Text3 class]];
    [self.topBar topBarReplaceObjectsAtIndexes:1 withObjects:@"123"];
    //    topBar.titleTextColor = [UIColor greenColor];
    //    topBar.selectedTitleTextColor = [UIColor yellowColor];
    //    topBar.titleTextFont = [UIFont systemFontOfSize:18];
    //
    //    topBar.selectSegmentImage = @"question_query_arrow_down_default";
    //    topBar.segmentImage = @"question_query_arrow_down_selected";
    //    topBar.segmentlineColor = [UIColor whiteColor];
    //    topBar.segmentbackColor = [UIColor redColor];
    //    topBar.selectSegmentbackColor = [UIColor blueColor];
    [self.navigationController pushViewController:self.topBar animated:YES];
}

@end
