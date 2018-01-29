//
//  CQTopBarViewController.m
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarViewController.h"
#import "CQTopBarSegment.h"
#import "CQTopBarView.h"
#import "CQTopBarSegmentCell.h"

@interface CQTopBarViewController ()<CQTopBarSegmentDelegate,CQTopBarViewDelegate>
@property (nonatomic,strong) CQTopBarSegment * segment;
@property (nonatomic,strong) CQTopBarView * barView;
@end

@implementation CQTopBarViewController

const NSUInteger segmentY = 64;
const NSUInteger segmentH = 40;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.sectionTitles.count!=self.pageViewClasses.count) return NSLog(@"两个数组大小必须一致");
    [self initUI];
    [self setAttribute];
}

- (void)initUI{
    self.segmentFrame = self.segmentFrame.origin.y == 0?CGRectMake(0, segmentY, CGRectGetWidth(self.view.bounds), segmentH):self.segmentFrame;
    
    self.segment = [[CQTopBarSegment alloc] initWithFrame:self.segmentFrame sectionTitles:self.sectionTitles];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
    
    self.barView = [[CQTopBarView alloc] initWithFrame:CGRectMake(0, self.segmentFrame.origin.y+self.segmentFrame.size.height, self.segmentFrame.size.width, 0) pageViews:self.pageViewClasses];
    self.barView.delegate = self;
    [self.view addSubview:self.barView];
    
    for (int i=0; i<self.pageViewClasses.count; i++) {
        Class controllerClass = self.pageViewClasses[i];
        UIViewController *controller = [[controllerClass alloc] init];
        [self addChildViewController:controller];
        [self.barView.viewArray addObject:controller.view];
    }
}

- (void)setAttribute{
    self.segment.titleTextColor = self.titleTextColor;
    self.segment.selectedTitleTextColor = self.selectedTitleTextColor;
    self.segment.titleTextFont = self.titleTextFont;
    self.segment.segmentImage = self.segmentImage;
    self.segment.selectSegmentImage = self.selectSegmentImage;
    self.segment.segmentlineColor = self.segmentlineColor;
    self.segment.segmentbackColor = self.segmentbackColor;
    self.segment.selectSegmentbackColor = self.selectSegmentbackColor;
}

- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id)objects{
    [self.segment topBarReplaceObjectsAtIndexes:indexes withObjects:objects BarView:self.barView];
}

- (void)setHiddenView:(BOOL)hiddenView{
    _hiddenView = hiddenView;
    if (hiddenView) {
        [self setViewAnimaWithHeight:0];
        [self.segment.collectionView reloadData];
    }else{
        [self setViewAnimaWithHeight:self.view.bounds.size.height-(self.segmentFrame.origin.y+self.segmentFrame.size.height)];
    }
}

- (void)topBarSegmentWithBlock:(CQTopBarSegment *)segment indexPath:(NSIndexPath *)indexPath{
    [self.barView.topBarCollectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    [self setViewAnimaWithHeight:self.view.bounds.size.height-(self.segmentFrame.origin.y+self.segmentFrame.size.height)];
}

- (void)topBarSegmentWithSegmentView:(CQTopBarSegment *)segmentView{
    [self setViewAnimaWithHeight:0];
}

- (void)topBarWithBarView:(CQTopBarView *)segment indexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[self.segment.collectionView cellForItemAtIndexPath:indexPath];
    cell.segmentBtn.hidden = YES;
    [cell.titleImage setTitleColor:self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor forState:UIControlStateNormal];
    // question_query_arrow_down_default
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
     [cell.titleImage setImage:[UIImage imageNamed:self.segmentImage==nil?@"":self.segmentImage] forState:UIControlStateNormal];
    [self setViewAnimaWithHeight:0];
}

- (void)setViewAnimaWithHeight:(CGFloat)height{
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        CGRect rect = self.barView.frame;
        rect.size.height = height;
        self.barView.frame = rect;
    } completion:nil];
}

@end
