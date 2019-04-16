//
//  JKCursorLabel.m
//  CodeTextDemo
//
//  Created by anfa on 2019/4/16.
//  Copyright © 2019 小侯爷. All rights reserved.
//

#import "JKCursorLabel.h"

@implementation JKCursorLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

#pragma mark - 初始化View
- (void)setupView
{
    UIView *cursorView = [[UIView alloc] init];
    cursorView.backgroundColor = [UIColor blackColor];
    cursorView.alpha = 0;
    [self addSubview:cursorView];
    _cursorView = cursorView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat h = 30;
    CGFloat w = 2;
    CGFloat x = self.bounds.size.width * 0.5;
    CGFloat y = self.bounds.size.height * 0.5;
    self.cursorView.frame = CGRectMake(0, 0, w, h);
    self.cursorView.center = CGPointMake(x, y);
}

- (void)startAnimating
{
    if (self.text.length > 0) return;
    
    CABasicAnimation *oa = [CABasicAnimation animationWithKeyPath:@"opacity"];
    oa.fromValue = [NSNumber numberWithFloat:0];
    oa.toValue = [NSNumber numberWithFloat:1];
    oa.duration = 1;
    oa.repeatCount = MAXFLOAT;
    oa.removedOnCompletion = NO;
    oa.fillMode = kCAFillModeForwards;
    oa.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.cursorView.layer addAnimation:oa forKey:@"opacity"];
}

- (void)stopAnimating
{
    [self.cursorView.layer removeAnimationForKey:@"opacity"];
}

@end
