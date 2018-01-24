//
//  CQTopBarViewController.m
//  CQTopBar
//
//  Created by yto on 2018/1/9.
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

#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@implementation CQTopBarViewController

//- (instancetype _Nonnull )initWithTitles:(NSArray<NSString *> * _Nonnull)sectionTitles pageViewClasses:(NSArray<Class> * _Nonnull) pageViewClasses{
//    self = [super init];
//    if (self) {
//        NSAssert(self.sectionTitles.count==self.pageViewClasses.count, @"两个数组大小必须一致");
//        self.sectionTitles = sectionTitles;
//        self.pageViewClasses = pageViewClasses;
//        [self initUI];
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.sectionTitles.count!=self.pageViewClasses.count) return NSLog(@"两个数组大小必须一致");
    [self initUI];
    [self setAttribute];
}

- (void)initUI{
    self.segment = [[CQTopBarSegment alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), 40) sectionTitles:self.sectionTitles];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
    
    self.barView = [[CQTopBarView alloc] initWithFrame:CGRectMake(0, 64+40, KScreenWidth, 0) pageViews:self.pageViewClasses];
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
    self.segment.segmentLabel = self.segmentLabel;
}

- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id)objects{
    [self.segment topBarReplaceObjectsAtIndexes:indexes withObjects:objects BarView:self.barView];
}

- (void)topBarSegmentWithBlock:(CQTopBarSegment *)segment indexPath:(NSIndexPath *)indexPath{
    [self.barView.topBarCollectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
    [self setViewAnimaWithHeight:KScreenHeight-(64+40)];
}

- (void)topBarSegmentWithSegmentView:(CQTopBarSegment *)segmentView{
    [self setViewAnimaWithHeight:0];
}

- (void)topBarWithBarView:(CQTopBarView *)segment indexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[self.segment.collectionView cellForItemAtIndexPath:indexPath];
    cell.segmentBtn.hidden = YES;
    cell.segmentLabel.highlightedTextColor = self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor;
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
    cell.segmentImage.image = [UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage];
//    cell.segmentImage.transform = CGAffineTransformMakeRotation(0);
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
