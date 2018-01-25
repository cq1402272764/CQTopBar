//
//  CQTopBarSegment.m
//  CQTopBar
//
//  Created by yto on 2018/1/10.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarSegment.h"
#import "CQTopBarSegmentCell.h"
#import "CQTopBarView.h"

#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface CQTopBarSegment ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,CQTopBarSegmentCellDelegate>
@end

@implementation CQTopBarSegment

static NSString *ID = @"CQTopBarSegmentCell";
const NSUInteger defaultTextSize = 13;

- (instancetype)initWithFrame:(CGRect)frame sectionTitles:(NSArray *)sectionTitles{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = frame;
        rect.origin.y = 0;
        frame = rect;
        if (sectionTitles.count != 0) {
            [self initUIWithFrame:frame sectionTitles:sectionTitles];
        }
    }
    return self;
}

- (void)initUIWithFrame:(CGRect)frame sectionTitles:(NSArray *)sectionTitles{
    self.sectionTitles = [NSMutableArray arrayWithArray:sectionTitles];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    layout.itemSize = CGSizeMake(KScreenWidth/_sectionTitles.count, frame.size.height-1);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.backgroundColor = self.segmentlineColor==nil?[UIColor grayColor]:self.segmentlineColor;
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[CQTopBarSegmentCell class] forCellWithReuseIdentifier:ID];
}

- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id)objects BarView:(CQTopBarView *)barView{
    [self.sectionTitles replaceObjectAtIndex:indexes withObject:objects];
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        CGRect rect = barView.frame;
        rect.size.height = 0;
        barView.frame = rect;
    } completion:nil];
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.sectionTitles.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.segmentLabel.font = self.titleTextFont==nil?[UIFont systemFontOfSize:defaultTextSize]:self.titleTextFont;
    cell.segmentLabel.textColor = (self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor);
    cell.segmentLabel.text = self.sectionTitles[indexPath.row];
    cell.segmentBtn.hidden = YES;
    cell.segmentImage.image = [UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage];
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
    cell.delegate = self;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    cell.segmentBtn.hidden = !cell.selected;
    cell.segmentLabel.highlightedTextColor = self.selectedTitleTextColor==nil?[UIColor redColor]:self.selectedTitleTextColor;
    cell.backgroundColor = self.selectSegmentbackColor == nil?[UIColor whiteColor]:self.selectSegmentbackColor;
    if ([_delegate respondsToSelector:@selector(topBarSegmentWithBlock:indexPath:)]) {
        [_delegate topBarSegmentWithBlock:self indexPath:indexPath];
    }
    cell.segmentImage.image = [UIImage imageNamed:self.selectSegmentImage==nil?@"question_query_arrow_down_selected":self.selectSegmentImage];
}

- (void)topBarSegmentCellWithBlock:(CQTopBarSegmentCell *)topBar{
    topBar.segmentBtn.hidden = YES;
    topBar.segmentLabel.highlightedTextColor = self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor;
    if ([_delegate respondsToSelector:@selector(topBarSegmentWithSegmentView:)]) {
        [_delegate topBarSegmentWithSegmentView:self];
    }
    [self setupCellAttribute:topBar];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = NO;
    cell.segmentBtn.hidden = !cell.selected;
    [self setupCellAttribute:cell];
}

- (void)setupCellAttribute:(CQTopBarSegmentCell *)cell{
    cell.segmentImage.image = [UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage];
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
}

@end
