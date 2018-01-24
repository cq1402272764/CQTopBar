//
//  CQTopBarViewController.h
//  CQTopBar
//
//  Created by yto on 2018/1/9.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class CQTopBarViewController;
//
//typedef CQTopBarViewController * _Nullable (^setAttribute)(void);


@interface CQTopBarViewController : UIViewController
///**
// 初始化
// */
//- (instancetype _Nonnull )initWithTitles:(NSArray<NSString *> * _Nonnull)sectionTitles pageViewClasses:(NSArray<Class> * _Nullable  _Nonnull) pageViewClasses;

// 修改文字
- (void)topBarReplaceObjectsAtIndexes:(NSUInteger)indexes withObjects:(id _Nullable )objects;
/**
 需要显示的文本数组
 */
@property (nonatomic, strong) NSArray * _Nullable sectionTitles;

/**
 要加载的ViewController，传ClassName即可
 */
@property(nonatomic, copy) NSArray * _Nullable pageViewClasses;

/**
 不选中时文本的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable titleTextColor UI_APPEARANCE_SELECTOR;

/**
 选中文本的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable selectedTitleTextColor UI_APPEARANCE_SELECTOR;

/**
 需要显示的文本字体
 */
@property (nonatomic, strong) UIFont * _Nullable titleTextFont;

/**
 未选中后的图标
 */
@property (nonatomic, strong) NSString * _Nullable segmentImage;

/**
 选中后的图标
 */
@property (nonatomic, strong) NSString * _Nullable selectSegmentImage;

/**
 线条的颜色
 */
@property (nonatomic, strong) UIColor * _Nullable segmentlineColor;
/**
 未选中的背景色
 */
@property (nonatomic, strong) UIColor * _Nullable segmentbackColor;
/**
 选中的背景色
 */
@property (nonatomic, strong) UIColor * _Nullable selectSegmentbackColor;
/**
 选择后的文字
 */
@property(nonatomic,strong)UILabel * _Nullable segmentLabel;
@end
