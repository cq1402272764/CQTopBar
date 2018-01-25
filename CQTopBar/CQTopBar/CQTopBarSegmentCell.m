//
//  CQTopBarSegmentCell.m
//  CQTopBar
//
//  Created by CQ on 2018/1/10.
//  Copyright © 2018年 CQ. All rights reserved.
//

#import "CQTopBarSegmentCell.h"

@implementation CQTopBarSegmentCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.segmentLabel = [[UILabel alloc] init];
        self.segmentLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.segmentLabel];
        
        self.segmentImage = [[UIImageView alloc] init];
        [self.contentView addSubview:self.segmentImage];
        self.segmentImage.contentMode = UIViewContentModeCenter;
        
        self.segmentBtn = [[UIButton alloc] init];
        self.segmentBtn.hidden = YES;
        [self.segmentBtn addTarget:self action:@selector(segmentViewBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.segmentBtn];
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.segmentLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds)-30, CGRectGetHeight(self.bounds));
    self.segmentImage.frame = CGRectMake(CGRectGetWidth(self.bounds)-30, 0, 30, CGRectGetHeight(self.bounds));
    self.segmentBtn.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
}

- (void)segmentViewBtn{
    if ([_delegate respondsToSelector:@selector(topBarSegmentCellWithBlock:)]) {
        [_delegate topBarSegmentCellWithBlock:self];
    }
}

@end
