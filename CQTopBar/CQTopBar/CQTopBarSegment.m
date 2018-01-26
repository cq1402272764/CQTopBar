//
//  CQTopBarSegment.m
//  CQTopBar
//
//  Created by CQ on 2018/1/10.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarSegment.h"
#import "CQTopBarSegmentCell.h"
#import "CQTopBarView.h"

#define KScreenWidth [[UIScreen mainScreen] bounds].size.width

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
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    layout.itemSize = CGSizeMake(frame.size.width/_sectionTitles.count, frame.size.height-1);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
//    self.collectionView.backgroundColor = self.segmentlineColor==nil?[UIColor whiteColor]:self.segmentlineColor;
    self.collectionView.backgroundColor = [UIColor whiteColor];
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
//    cell.segmentLabel.font = self.titleTextFont==nil?[UIFont systemFontOfSize:defaultTextSize]:self.titleTextFont;
    cell.titleImage.titleLabel.font = self.titleTextFont==nil?[UIFont systemFontOfSize:defaultTextSize]:self.titleTextFont;
//    cell.segmentLabel.textColor = (self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor);
    [cell.titleImage setTitleColor:self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor forState:UIControlStateNormal];
//    cell.segmentLabel.text = self.sectionTitles[indexPath.row];
    [cell.titleImage setTitle:self.sectionTitles[indexPath.row] forState:UIControlStateNormal];
    cell.segmentBtn.hidden = YES;
//    cell.segmentImage.image = [UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage];
    [cell.titleImage setImage:[UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage] forState:UIControlStateNormal];
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
    if (indexPath.row==self.sectionTitles.count-1) {
        cell.line.hidden = YES;
    }else{
        cell.line.hidden = NO;
    }
    
    cell.delegate = self;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CQTopBarSegmentCell *cell = (CQTopBarSegmentCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.selected = YES;
    cell.segmentBtn.hidden = !cell.selected;
//    cell.segmentLabel.highlightedTextColor = self.selectedTitleTextColor==nil?[UIColor redColor]:self.selectedTitleTextColor;
    [cell.titleImage setTitleColor:self.selectedTitleTextColor == nil?[UIColor redColor]:self.selectedTitleTextColor forState:UIControlStateNormal];
    cell.backgroundColor = self.selectSegmentbackColor == nil?[UIColor whiteColor]:self.selectSegmentbackColor;
    if ([_delegate respondsToSelector:@selector(topBarSegmentWithBlock:indexPath:)]) {
        [_delegate topBarSegmentWithBlock:self indexPath:indexPath];
    }
//    cell.segmentImage.image = [UIImage imageNamed:self.selectSegmentImage==nil?@"question_query_arrow_down_selected":self.selectSegmentImage];
    [cell.titleImage setImage:[UIImage imageNamed:self.selectSegmentImage==nil?@"question_query_arrow_down_selected":self.selectSegmentImage] forState:UIControlStateNormal];
}

- (void)topBarSegmentCellWithBlock:(CQTopBarSegmentCell *)topBar{
    topBar.segmentBtn.hidden = YES;
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
//    cell.segmentImage.image = [UIImage imageNamed:self.segmentImage==nil?@"question_query_arrow_down_default":self.segmentImage];
    [cell.titleImage setImage:[UIImage imageNamed:self.selectSegmentImage==nil?@"question_query_arrow_down_default":self.selectSegmentImage] forState:UIControlStateNormal];
//    topBar.segmentLabel.highlightedTextColor = self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor;
    [cell.titleImage setTitleColor:self.titleTextColor==nil?[UIColor blackColor]:self.titleTextColor forState:UIControlStateNormal];
    cell.backgroundColor = self.segmentbackColor == nil?[UIColor whiteColor]:self.segmentbackColor;
}

@end
