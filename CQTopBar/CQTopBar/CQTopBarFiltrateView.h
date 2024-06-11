//
//  CQTopBarFiltrateView.h
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CQTopBarFiltrateView;
@protocol CQTopBarFiltrateViewDelegate <NSObject>
@optional
- (void)topBarWithBarView:(CQTopBarFiltrateView *)topBar indexPath:(NSIndexPath *)indexPath;
@end
@interface CQTopBarFiltrateView : UIView
@property (nonatomic, weak) id <CQTopBarFiltrateViewDelegate>delegate;
@property (nonatomic, strong) UICollectionView * topBarCollectionView;
@property (nonatomic, strong) NSArray * pageView;
- (instancetype)initWithFrame:(CGRect)frame pageViews:(NSArray *)pageViews;
@end
