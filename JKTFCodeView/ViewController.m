//
//  ViewController.m
//  JKTFCodeView
//
//  Created by anfa on 2019/5/7.
//  Copyright © 2019 anfa. All rights reserved.
//

#import "ViewController.h"

#import "JKTFSquareView.h"        // 方块 - 有光标
#import "JKTFCursorView.h"        // 下划线 - 有光标

@interface ViewController ()
@property (nonatomic, weak) JKTFCursorView   *code1View;
@property (nonatomic, weak) JKTFSquareView  *code2View;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.layer.borderColor = [[UIColor grayColor] CGColor];
    scrollView.layer.borderWidth = 0.5;
    scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:scrollView];
    
    UILabel *labx = [UILabel new];
    labx.textColor = [UIColor grayColor];
    labx.font = [UIFont systemFontOfSize:16];
    labx.text = @"😘页面可滑动，防止键盘挡住效果😘";
    labx.frame = CGRectMake(30, 90, 320, 15);
    [scrollView addSubview:labx];
    
    
    
    CGFloat x = 30;
    CGFloat w = [UIScreen mainScreen].bounds.size.width - x * 2;
    CGFloat h = 50;
    CGFloat y = 140;
    
    // --------------------------------------------------------------------
    
    UILabel *labA = [UILabel new];
    labA.textColor = [UIColor orangeColor];
    labA.font = [UIFont systemFontOfSize:13];
    labA.text = @"基本实现原理 - 下划线";
    labA.frame = CGRectMake(x, y, 200, 15);
    [scrollView addSubview:labA];
    
    y = CGRectGetMaxY(labA.frame) + 10;
    
    JKTFCursorView *code1View = [[JKTFCursorView alloc] initWithCount:6 margin:20];
    code1View.frame = CGRectMake(x, y, w, h);
    [code1View setInputBlock:^(NSString * _Nonnull inputResult) {
        NSLog(@"code1View输入结果:%@",inputResult);
    }];
    [scrollView addSubview:code1View];
    self.code1View = code1View;
    
    
    // --------------------------------------------------------------------
    
    y = CGRectGetMaxY(code1View.frame) + 60;
    
    UILabel *labB = [UILabel new];
    labB.textColor = [UIColor orangeColor];
    labB.font = [UIFont systemFontOfSize:13];
    labB.text = @"基本实现原理 - 方块";
    labB.frame = CGRectMake(x, y, 200, 15);
    [scrollView addSubview:labB];
    
    y = CGRectGetMaxY(labB.frame) + 30;
    
    JKTFSquareView *code2View = [[JKTFSquareView alloc] initWithCount:6 margin:20];
    code2View.frame = CGRectMake(x, y, w, h);
    [code2View setInputBlock:^(NSString * _Nonnull inputResult) {
        NSLog(@"code2View输入结果:%@",inputResult);
    }];
    [scrollView addSubview:code2View];
    self.code2View = code2View;
    
    
    // --------------------------------------------------------------------
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [scrollView addGestureRecognizer:tap];
}


- (void)tap
{
    [self.code1View endEditing:YES];
    [self.code2View endEditing:YES];
    
}

@end
