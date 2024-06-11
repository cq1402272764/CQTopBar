//
//  testView1.h
//  CQTopBar
//
//  Created by CQ on 2024/6/7.
//  Copyright © 2024 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface testView1 : UIView
@property (copy, nonatomic) void(^titleLabel)(NSString *str);
@end

NS_ASSUME_NONNULL_END
