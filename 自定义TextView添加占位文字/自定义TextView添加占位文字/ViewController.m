//
//  ViewController.m
//  自定义TextView添加占位文字
//
//  Created by xiaohuge on 16/1/22.
//  Copyright © 2016年 xiaohuge. All rights reserved.
//

#import "ViewController.h"
#import "ZBHTextView.h"
@interface ViewController ()<UITextViewDelegate>
/** 自定义的textView */
@property(nonatomic, strong) ZBHTextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航条内容
    [self setupNav];
    
    //添加文本框
    [self setupTextView];
    
}
#pragma mark -- 初始化
//导航条内容
- (void)setupNav{
    
    self.title = @"发文字";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(post)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    //强制刷新
    [self.navigationController.navigationBar layoutIfNeeded];
}

- (void)setupTextView{
    
    ZBHTextView *textView = [[ZBHTextView alloc] init];
    textView.frame = self.view.bounds;
    //设置可以上下拖动
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    textView.placeholder = @"我是占位文字....我是占位文字....我是占位文字....我是占位文字....我是占位文字....我是占位文字....哈哈哈";
    [self.view addSubview:textView];
    self.textView = textView;
}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)post{
    //发表
}

#pragma mark -- UITextFieldDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //拖拽时 结束编辑 退出键盘
    [self.textView endEditing:YES];
}

- (void)textViewDidChange:(UITextView *)textView{
    //判读是否有文字  设置发表按钮的状态
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}
@end
