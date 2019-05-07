//
//  JKTFSquareView.m
//  CodeTextDemo
//
//  Created by anfa on 2019/4/16.
//  Copyright © 2019 小侯爷. All rights reserved.
//

#import "JKTFSquareView.h"
#import "JKCursorLabel.h"

@interface JKTFSquareView ()

@property (nonatomic, assign) NSInteger itemCount;

@property (nonatomic, assign) CGFloat itemMargin;

@property (nonatomic, weak) UITextField *textField;

@property (nonatomic, weak) UIControl *maskView;

@property (nonatomic, strong) NSMutableArray<JKCursorLabel *> *labels;

@property (nonatomic, weak) JKCursorLabel *currentLabel;

@end

@implementation JKTFSquareView

#pragma mark - 初始化
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin
{
    if (self = [super init]) {
        
        self.itemCount = count;
        self.itemMargin = margin;
        
        [self configTextField];
    }
    return self;
}

- (void)configTextField
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.labels = @[].mutableCopy;
    
    UITextField *textField = [[UITextField alloc] init];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField addTarget:self action:@selector(tfEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    
    [self addSubview:textField];
    self.textField = textField;
    
    UIButton *maskView = [UIButton new];
    maskView.backgroundColor = [UIColor whiteColor];
    [maskView addTarget:self action:@selector(clickMaskView) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:maskView];
    self.maskView = maskView;
    
    for (NSInteger i = 0; i < self.itemCount; i++)
    {
        JKCursorLabel *label = [JKCursorLabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor darkTextColor];
        label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:36];
        label.layer.borderColor = [[UIColor blackColor] CGColor];
        label.layer.borderWidth = 1;
        [self addSubview:label];
        [self.labels addObject:label];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.labels.count != self.itemCount) return;
    
    CGFloat temp = self.bounds.size.width - (self.itemMargin * (self.itemCount - 1));
    CGFloat w = temp / self.itemCount;
    CGFloat x = 0;
    
    for (NSInteger i = 0; i < self.labels.count; i++)
    {
        x = i * (w + self.itemMargin);
        
        JKCursorLabel *label = self.labels[i];
        label.frame = CGRectMake(x, 0, w, self.bounds.size.height);
    }
    
    self.textField.frame = self.bounds;
    self.maskView.frame = self.bounds;
}

#pragma mark - 编辑改变
- (void)tfEditingChanged:(UITextField *)textField
{
    if (textField.text.length > self.itemCount) {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, self.itemCount)];
    }
    
    for (int i = 0; i < self.itemCount; i++)
    {
        JKCursorLabel *label = [self.labels objectAtIndex:i];
        
        if (i < textField.text.length) {
            label.text = [textField.text substringWithRange:NSMakeRange(i, 1)];
        } else {
            label.text = nil;
        }
    }
    
    [self cursor];
    
    // 输入完毕后，自动隐藏键盘
    if (textField.text.length >= self.itemCount) {
        [self.currentLabel stopAnimating];
        if (self.inputBlock) {
            self.inputBlock(self.textField.text);
        }
        [textField resignFirstResponder];
    }
}

- (void)clickMaskView
{
    [self.textField becomeFirstResponder];
    [self cursor];
}

- (BOOL)endEditing:(BOOL)force
{
    [self.textField endEditing:force];
    [self.currentLabel stopAnimating];
    return [super endEditing:force];
}

#pragma mark - 处理光标
- (void)cursor
{
    [self.currentLabel stopAnimating];
    
    NSInteger index = self.code.length;
    if (index < 0) index = 0;
    if (index >= self.labels.count) index = self.labels.count - 1;
    
    JKCursorLabel *label = [self.labels objectAtIndex:index];
    
    [label startAnimating];
    self.currentLabel = label;
}

- (NSString *)code
{
    return self.textField.text;
}

@end
