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

const CGFloat space = 5;
const CGFloat spaceX = 3;

+ (instancetype)segmentTitleImageButtons{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeLeft;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat titleX = (contentRect.size.width-([self titleWithWidth:contentRect.size.width]+image.size.width+space)-spaceX*2)/2+spaceX;
    CGFloat titleY = 0;
    CGFloat titleW = [self titleWithWidth:contentRect.size.width];
    
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat imageX = (contentRect.size.width-([self titleWithWidth:contentRect.size.width]+image.size.width+space)-spaceX*2)/2+[self titleWithWidth:contentRect.size.width]+space+spaceX;
    CGFloat imageY = 0;
    CGFloat imageW = image.size.width;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGFloat)titleWithWidth:(CGFloat)width{
    UIImage *image = [self imageForState:UIControlStateNormal];
    NSString *title = [self titleForState:UIControlStateNormal];
    CGSize size = CGSizeMake(width, MAXFLOAT);
    CGFloat titleW = [title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.width;
    if (titleW+space+image.size.width+spaceX*2>width) titleW = width - space -image.size.width-spaceX*2;
    return titleW;
}

@end
