//
//  CQTopBarView.h
//  CQTopBar
//
//  Created by CQ on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQTopBarView : UIView

/**
 初始化
 contentView:topBar的中间其他view显示
 sectionTitles:Segment文字数组
 pageViews:下拉出来的view数组
 */
- (instancetype _Nonnull)initWithFrame:(CGRect)frame
                           ContentView:(UIView *_Nonnull)contentView
                         SectionTitles:(NSArray *_Nonnull)sectionTitles
                             PageViews:(NSArray *_Nonnull)pageViews;

/**
 * 修改segment文字
 * indexes:需要修改第几个文字
 * objects:需要修改文字内容
 */
- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id _Nullable)objects;

/**
 是否隐藏当前显示View
 */
@property (nonatomic, assign) BOOL hiddenView;

/**
 不选中Segment时文本的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable titleTextColor UI_APPEARANCE_SELECTOR;

/**
 选中Segment文本的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable selectedTitleTextColor UI_APPEARANCE_SELECTOR;

/**
 Segment需要显示的文本字体
 */
@property (nonatomic, strong) UIFont * _Nullable titleTextFont;

/**
 未选中Segment后的图标
 */
@property (nonatomic, strong) NSString * _Nullable segmentImage;

/**
 选中Segment后的图标
 */
@property (nonatomic, strong) NSString * _Nullable selectSegmentImage;

/**
 线条Segment的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable segmentlineColor;

/**
 未选中Segment的背景色
 */
@property (nonatomic, strong) UIColor * _Nullable segmentbackColor;

/**
 选中Segment的背景色
 */
@property (nonatomic, strong) UIColor * _Nullable selectSegmentbackColor;

/**
 未选中Segment的背景图片
 */
@property (nonatomic, strong) UIImage * _Nullable segmentbackImage;

/**
 选中Segment的背景图片
 */
@property (nonatomic, strong) UIImage * _Nullable selectSegmentbackImage;

@end
