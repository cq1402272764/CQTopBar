//
//  CQSegmentTitleImage.m
//  CQTopBar
//
//  Created by yto on 2018/1/25.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQSegmentTitleImage.h"

@interface CQSegmentTitleImage()
@property (nonatomic, assign) CGFloat titleW;
@end

@implementation CQSegmentTitleImage

+ (instancetype)segmentTitleImageButtons{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat space = 5;
    CGFloat titleSpace =-image.size.width-space;
    CGFloat titleX = titleSpace;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat space = 5;
    CGFloat edgeSpace = (contentRect.size.width-([self titleWithWidth:contentRect.size.width]+image.size.width+space))/2+[self titleWithWidth:contentRect.size.width]+space;
    
    NSLog(@"===%f",edgeSpace);
    CGFloat imageX = -edgeSpace;
    CGFloat imageY = 0;
    CGFloat imageW = contentRect.size.width-image.size.width;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGFloat)titleWithWidth:(CGFloat)width{
    NSString *title = [self titleForState:UIControlStateNormal];
    CGSize size = CGSizeMake(width, MAXFLOAT);
    CGFloat titleW = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size.width;
    return titleW;
}

@end
