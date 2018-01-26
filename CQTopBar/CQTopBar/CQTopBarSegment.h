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
@property (nonatomic, strong)NSMutableArray * sectionTitles;
@property (nonatomic, strong) UIColor * titleTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIColor * selectedTitleTextColor UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong)UIFont * titleTextFont;
@property (nonatomic, strong) NSString * segmentImage;
@property (nonatomic, strong) NSString * selectSegmentImage;
@property (nonatomic, strong) UIColor * segmentlineColor;
@property (nonatomic, strong) UIColor * segmentbackColor;
@property (nonatomic, strong) UIColor * selectSegmentbackColor;

@end
