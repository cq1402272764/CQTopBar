//
//  CQTopBarView.m
//  CQTopBar
//
//  Created by yto on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarView.h"

#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define KScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface CQTopBarView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation CQTopBarView

static NSString *ID = @"CQTopBarViewCell";

- (NSMutableArray *)viewArray{
    if (_viewArray == nil) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}

- (instancetype)initWithFrame:(CGRect)frame pageViews:(NSArray *)pageViews{
    self = [super initWithFrame:frame];
    if (self) {
        CGRect rect = frame;
        rect.origin.y = 0;
        rect.size.height = KScreenHeight-(64+40);
        frame = rect;
        self.layer.masksToBounds = YES;
        if (pageViews.count != 0) {
            [self initUIWithFrame:frame pageViews:pageViews];
        }
    }
    return self;
}

- (void)initUIWithFrame:(CGRect)frame pageViews:(NSArray *)pageViews{
    self.pageView = pageViews;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.topBarCollectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    self.topBarCollectionView.dataSource = self;
    self.topBarCollectionView.delegate = self;
    self.topBarCollectionView.scrollEnabled = NO;
    self.topBarCollectionView.showsHorizontalScrollIndicator = NO;
    self.topBarCollectionView.clipsToBounds = YES;
    [self addSubview:self.topBarCollectionView];
    self.topBarCollectionView.backgroundColor = [UIColor clearColor];
    [self.topBarCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pageView.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [cell.contentView addSubview:self.viewArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([_delegate respondsToSelector:@selector(topBarWithBarView:indexPath:)]) {
        [_delegate topBarWithBarView:self indexPath:indexPath];
    }
}


@end
