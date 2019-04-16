//
//  JKTFCursorView.h
//  CodeTextDemo
//
//  Created by anfa on 2019/4/16.
//  Copyright © 2019 小侯爷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 下划线 - 有光标
 */
@interface JKTFCursorView : UIView

// ----------------------------Data----------------------------

@property (nonatomic,copy) void (^inputBlock)(NSString *inputResult);

// ----------------------------Method----------------------------

- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin;


- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

@end


NS_ASSUME_NONNULL_END
