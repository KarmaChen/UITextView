//
//  ViewController.m
//  UITextView
//
//  Created by Karma on 16/5/24.
//  Copyright © 2016年 陈昆涛. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UILabel *placeHolderLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 50, 200, 50) textContainer:nil];
    self.textView.font = [UIFont systemFontOfSize:12];
    self.textView.backgroundColor = [UIColor redColor];
    self.textView.delegate = self;
    
    self.placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 20)];
    self.placeHolderLabel.text = @"请输入你想要的内容";
    self.placeHolderLabel.font = [UIFont systemFontOfSize:12];
    self.placeHolderLabel.textColor = [UIColor lightGrayColor];
    
    [self.textView addSubview:self.placeHolderLabel];
    
    [self.view addSubview:self.textView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedView)];
    
    [self.view addGestureRecognizer:tap];
    
}
- (void)tapedView
{
    [self.view endEditing:YES];
    // 结束编辑的时候，如果文本长度为0，则继续显示提示文本
    if(self.textView.text.length == 0)
    {
        self.placeHolderLabel.hidden = NO;
    }
}
//告诉代理，某个textView的文本将要被修改。返回YES允许修改，NO不允许。
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"%@", textView.text);
    
    
    return YES;
}
// 告诉代理，textView的文本或文本属性已经被用户修改了。
- (void)textViewDidChange:(UITextView *)textView
{
    //  显示提示文本
    if(textView.text.length != 0)
    {
        self.placeHolderLabel.hidden = YES;
    }
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}
// 告诉代理，指定文本段已被修改。并且可以通过textView的selectedRange属性获取到修改范围。
- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
}
// 询问代理，是否允许用户可以对文本内的URL做出请求交互。返回YES允许，NO不允许。

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return YES;
}
// 询问代理，是否允许用户对范围内文本的附属内容做出相应交互。YES允许，NO不允许
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange
{
    return YES;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
