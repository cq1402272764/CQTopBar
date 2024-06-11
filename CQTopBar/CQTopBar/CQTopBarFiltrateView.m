//
//  CQTopBarFiltrateView.m
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarFiltrateView.h"

#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface CQTopBarFiltrateView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation CQTopBarFiltrateView

static NSString *ID = @"CQTopBarFiltrateViewCell";

- (NSArray *)pageView{
    if (!_pageView) {
        _pageView = [NSArray array];
    }
    return _pageView;
}

- (instancetype)initWithFrame:(CGRect)frame pageViews:(NSArray *)pageViews{
    self = [super initWithFrame:frame];
    if (self) {
        if (pageViews.count != 0) {
            [self initUIWithFrame:frame pageViews:pageViews];
        }
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    if (self.topBarCollectionView != nil){
        UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.topBarCollectionView.collectionViewLayout;
        layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
        self.topBarCollectionView.collectionViewLayout = layout;
        self.topBarCollectionView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
}

- (void)initUIWithFrame:(CGRect)frame pageViews:(NSArray *)pageViews{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.topBarCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
    self.topBarCollectionView.dataSource = self;
    self.topBarCollectionView.delegate = self;
    self.topBarCollectionView.scrollEnabled = NO;
    self.topBarCollectionView.showsHorizontalScrollIndicator = NO;
    self.topBarCollectionView.clipsToBounds = YES;
    [self addSubview:self.topBarCollectionView];
    self.topBarCollectionView.backgroundColor = [UIColor clearColor];
    [self.topBarCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.pageView = pageViews;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pageView.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView *contentView = self.pageView[indexPath.row];
    [UIView animateKeyframesWithDuration:0.3 delay:0 options:UIViewKeyframeAnimationOptionCalculationModePaced animations:^{
        contentView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        [cell.contentView addSubview:contentView];
    } completion:nil];
    cell.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(topBarWithBarView:indexPath:)]) {
        [_delegate topBarWithBarView:self indexPath:indexPath];
    }
}


@end
