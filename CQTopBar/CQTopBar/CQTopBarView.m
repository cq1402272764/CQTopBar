//
//  CQTopBarView.m
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarView.h"
#import "CQTopBarSegment.h"
#import "CQTopBarFiltrateView.h"
#import "CQTopBarSegmentCell.h"


#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})\

#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface CQTopBarView ()<CQTopBarSegmentDelegate,CQTopBarFiltrateViewDelegate>
@property (nonatomic, strong) CQTopBarSegment *segment;
@property (nonatomic, strong) CQTopBarFiltrateView *barView;
@end

@implementation CQTopBarView

- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                           ContentView:(UIView *)contentView
                         SectionTitles:(NSArray *_Nonnull)sectionTitles
                             PageViews:(NSArray *_Nonnull)pageViews{
    CGFloat segmentY = frame.origin.y;
    CGFloat segmentH = frame.size.height;
    CGFloat barViewH = KScreenHeight - [self currentDeviceTabbarBottomHeight] - segmentY - segmentH;
    CGRect topBarFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, barViewH);
    self = [super initWithFrame:topBarFrame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        if (sectionTitles.count == 0 || pageViews.count == 0){
            NSLog(@"数据不能不为空");
        }else if (sectionTitles.count != pageViews.count){
            NSLog(@"两个数组大小必须一致");
        }else{
            [self initUIWithSectionTitles:sectionTitles 
                                pageViews:pageViews
                              ContentView:contentView
                                 segmentH:segmentH
                                 barViewH:barViewH];
        }
    }
    return self;
}

- (void)initUIWithSectionTitles:(NSArray *)sectionTitles 
                      pageViews:(NSArray *)pageViews
                    ContentView:(UIView *)contentView
                       segmentH:(CGFloat)segmentH
                       barViewH:(CGFloat)barViewH{
    CGFloat segmentW = self.frame.size.width;
    self.segment = [[CQTopBarSegment alloc] initWithFrame:CGRectMake(0, 0, segmentW, segmentH) sectionTitles:sectionTitles];
    self.segment.delegate = self;
    [self addSubview:self.segment];
    
    CGFloat barViewX = self.frame.origin.x;
    CGFloat barViewY = self.segment.frame.size.height;
    CGFloat barViewW = self.frame.size.width;
    
    if (contentView != nil && [contentView isKindOfClass:[UIView class]]){
        contentView.frame = CGRectMake(barViewX, barViewY, barViewW, barViewH);
        [self addSubview:contentView];
    }
    
    self.barView = [[CQTopBarFiltrateView alloc] initWithFrame:CGRectMake(barViewX, barViewY, barViewW, 0) pageViews:pageViews];
    self.barView.delegate = self;
    [self addSubview:self.barView];
}

- (void)setTitleTextColor:(UIColor *)titleTextColor{
    _titleTextColor = titleTextColor;
    self.segment.titleTextColor = titleTextColor;
}

- (void)setSelectedTitleTextColor:(UIColor *)selectedTitleTextColor{
    _titleTextColor = selectedTitleTextColor;
    self.segment.selectedTitleTextColor = selectedTitleTextColor;
}

- (void)setTitleTextFont:(UIFont *)titleTextFont{
    _titleTextFont = titleTextFont;
    self.segment.titleTextFont = titleTextFont;
}

- (void)setSegmentImage:(NSString *)segmentImage{
    _segmentImage = segmentImage;
    self.segment.segmentImage = segmentImage;
}

- (void)setSelectSegmentImage:(NSString *)selectSegmentImage{
    _selectSegmentImage = selectSegmentImage;
    self.segment.selectSegmentImage = selectSegmentImage;
}

- (void)setSegmentlineColor:(UIColor *)segmentlineColor{
    _segmentlineColor = segmentlineColor;
    self.segment.segmentlineColor = segmentlineColor;
}

- (void)setSegmentbackColor:(UIColor *)segmentbackColor{
    _segmentbackColor = segmentbackColor;
    self.segment.segmentbackColor = segmentbackColor;
}

- (void)setSelectSegmentbackColor:(UIColor *)selectSegmentbackColor{
    _selectSegmentbackColor = selectSegmentbackColor;
    self.segment.selectSegmentbackColor = selectSegmentbackColor;
}

- (void)setSegmentbackImage:(UIImage *)segmentbackImage{
    _segmentbackImage = segmentbackImage;
    self.segment.segmentbackImage = segmentbackImage;
}

- (void)setSelectSegmentbackImage:(UIImage *)selectSegmentbackImage{
    _selectSegmentbackImage = selectSegmentbackImage;
    self.segment.selectSegmentbackImage = selectSegmentbackImage;
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
        [self setViewAnimaWithHeight:self.frame.size.height];
    }
}

- (void)topBarSegmentWithBlock:(CQTopBarSegment *)segment indexPath:(NSIndexPath *)indexPath{
    [self setViewAnimaWithHeight:self.frame.size.height];
    [self.barView.topBarCollectionView selectItemAtIndexPath:indexPath animated:NO scrollPosition:UICollectionViewScrollPositionLeft];
}

- (void)topBarSegmentWithSegmentView:(CQTopBarSegment *)segmentView{
    [self setViewAnimaWithHeight:0];
}

- (void)topBarWithBarView:(CQTopBarView *)segment indexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[self.segment.collectionView cellForItemAtIndexPath:indexPath];
    cell.segmentBtn.hidden = YES;
    [cell.titleImage setTitleColor:self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor forState:UIControlStateNormal];
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
    [cell.titleImage setImage:[UIImage imageNamed:self.segmentImage==nil?@"":self.segmentImage] forState:UIControlStateNormal];
    [self setViewAnimaWithHeight:0];
}

- (void)setViewAnimaWithHeight:(CGFloat)height{
    CGRect rect = self.barView.frame;
    rect.size.height = height;
    self.barView.frame = rect;
}

- (CGFloat)currentDeviceTabbarBottomHeight{
    if (IPHONE_X){
        return 34;
    }
    return 0;
}

@end
