//
//  CQTopBarSegmentCell.h
//  CQTopBar
//
//  Created by CQ on 2018/1/10.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CQTopBarSegmentCell;
@protocol CQTopBarSegmentCellDelegate <NSObject>
@optional
- (void)topBarSegmentCellWithBlock:(CQTopBarSegmentCell *)topBar;
@end
@interface CQTopBarSegmentCell : UICollectionViewCell
@property (nonatomic, weak) id<CQTopBarSegmentCellDelegate>delegate;
@property(nonatomic,strong)UILabel * segmentLabel;
@property(nonatomic,strong)UIImageView * segmentImage;
@property(nonatomic,strong)UIButton * segmentBtn;
@end
