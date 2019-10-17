//
//  CQTopBarSegment.h
//  CQTopBar
//
//  Created by CQ on 2018/1/10.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CQTopBarSegment,CQTopBarView;
@protocol CQTopBarSegmentDelegate <NSObject>
@optional
- (void)topBarSegmentWithBlock:(CQTopBarSegment *)segment indexPath:(NSIndexPath *)indexPath;
- (void)topBarSegmentWithSegmentView:(CQTopBarSegment *)segmentView;
@end

@interface CQTopBarSegment : UIView
@property (nonatomic, weak) id<CQTopBarSegmentDelegate>delegate;
@property(nonatomic,strong) UICollectionView * collectionView;
- (instancetype)initWithFrame:(CGRect)frame sectionTitles:(NSArray *)sectionTitles;
- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id)objects BarView:(CQTopBarView *)barView;
@property (nonatomic, strong) NSMutableArray * sectionTitles;
@property (nonatomic, weak) UIColor * titleTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, weak) UIColor * selectedTitleTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, weak) UIFont * titleTextFont;
@property (nonatomic, copy) NSString * segmentImage;
@property (nonatomic, copy) NSString * selectSegmentImage;
@property (nonatomic, weak) UIColor * segmentlineColor;
@property (nonatomic, weak) UIColor * segmentbackColor;
@property (nonatomic, weak) UIColor * selectSegmentbackColor;
@property (nonatomic, weak) UIImage * _Nullable segmentbackImage;
@property (nonatomic, weak) UIImage * _Nullable selectSegmentbackImage;

@end
