//
//  JKTFSquareView.h
//  CodeTextDemo
//
//  Created by anfa on 2019/4/16.
//  Copyright © 2019 小侯爷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  方块
 */
@interface JKTFSquareView : UIView

@property (nonatomic,copy) void (^inputBlock)(NSString *inputResult);

- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
