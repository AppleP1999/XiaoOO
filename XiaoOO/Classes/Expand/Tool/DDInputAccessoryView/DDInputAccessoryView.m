//
//  DDInputAccessoryView.m
//  XiaoOO
//
//  Created by hf on 2017/1/17.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDInputAccessoryView.h"

#define DDIAV_MAIN_W    CGRectGetWidth([UIScreen mainScreen].bounds)
#define DDIAV_MAIN_H    CGRectGetHeight([UIScreen mainScreen].bounds)
#define DDIAV_Edge_Hori 5
#define DDIAV_Edge_Vert 7
#define DDIAV_Btn_W    40
#define DDIAV_Btn_H    35


#define UUIAV_MAIN_W    CGRectGetWidth([UIScreen mainScreen].bounds)
#define UUIAV_MAIN_H    CGRectGetHeight([UIScreen mainScreen].bounds)
#define UUIAV_Edge_Hori 5
#define UUIAV_Edge_Vert 7
#define UUIAV_Btn_W    40
#define UUIAV_Btn_H    35

@interface DDInputAccessoryView()<UITextViewDelegate>
{
    DDInputAccessoryBlock inputBlock;
    UIButton * backButton ;
    UITextField * assistTxf;
    UITextView *  inputView;
    UIButton * saveButton;
    // dirty code for iOS9

    BOOL shouldDismiss;
 }
@end
@implementation DDInputAccessoryView

+(DDInputAccessoryView*)sharedView
{
    static dispatch_once_t onceToken;
    
    static DDInputAccessoryView  * sharedView ;
    dispatch_once(&onceToken, ^{
        sharedView = [[DDInputAccessoryView alloc] init];
        
        UIButton *backgroundBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backgroundBtn.frame = CGRectMake(0, 0, UUIAV_MAIN_W, UUIAV_MAIN_H);
        [backgroundBtn addTarget:sharedView action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        backgroundBtn.backgroundColor=[UIColor clearColor];
        
        UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, UUIAV_MAIN_W, UUIAV_Btn_H+2*UUIAV_Edge_Vert)];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(UUIAV_Edge_Hori, UUIAV_Edge_Vert, UUIAV_MAIN_W-UUIAV_Btn_W-4*UUIAV_Edge_Hori, UUIAV_Btn_H)];
        textView.returnKeyType = UIReturnKeyDone;
        textView.enablesReturnKeyAutomatically = YES;
        textView.delegate = sharedView;
        textView.font = [UIFont systemFontOfSize:14];
        textView.layer.cornerRadius = 5;
        textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        textView.layer.borderWidth = 0.5;
        [toolbar addSubview:textView];
        
        UITextField *assistTxf = [UITextField new];
        assistTxf.returnKeyType = UIReturnKeyDone;
        assistTxf.enablesReturnKeyAutomatically = YES;
        [backgroundBtn addSubview:assistTxf];
        assistTxf.inputAccessoryView = toolbar;
        
        UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        saveBtn.frame = CGRectMake(UUIAV_MAIN_W-UUIAV_Btn_W-2*UUIAV_Edge_Hori, UUIAV_Edge_Vert, UUIAV_Btn_W, UUIAV_Btn_H);
        saveBtn.backgroundColor = [UIColor clearColor];
        [saveBtn setTitle:@"确定" forState:UIControlStateNormal];
        [saveBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [saveBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [saveBtn addTarget:sharedView action:@selector(saveContent) forControlEvents:UIControlEventTouchUpInside];
        [toolbar addSubview:saveBtn];
        
        sharedView -> backButton = backgroundBtn;
        sharedView -> saveButton = saveBtn;
        sharedView -> inputView  = textView;
        sharedView -> assistTxf  = assistTxf;
        
        
    });
    
    return sharedView;
}
-(void)dismiss
{

    shouldDismiss = YES;
    [inputView resignFirstResponder];
    [backButton removeFromSuperview];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
-(void)saveContent
{
    
    [inputView resignFirstResponder];
    !inputBlock ? :inputBlock(inputView.text);
    [self dismiss ];

}

+ (void)showBlock:(DDInputAccessoryBlock)block{
    [[DDInputAccessoryView sharedView] showKeyboardType:UIKeyboardTypeDefault content:@"" Block:block];
}


+ (void)showKeyboardType:(UIKeyboardType)type
                   Block:(DDInputAccessoryBlock)block{
    [[DDInputAccessoryView sharedView] showKeyboardType:type content:@"" Block:block];
}

+ (void)showKeyboardType:(UIKeyboardType)type content:(NSString *)content Block:(DDInputAccessoryBlock)block
{
    [[DDInputAccessoryView sharedView] showKeyboardType:type content:content Block:block];
     
}
- (void)showKeyboardType:(UIKeyboardType)type
                 content:(NSString *)content
                   Block:(DDInputAccessoryBlock)block{
    
    UIWindow * window = [ UIApplication sharedApplication].keyWindow;
    [window addSubview: backButton];
    
    inputBlock             = block;
    shouldDismiss          = NO;
    inputView.text = content;
    assistTxf.text = content;
    inputView.keyboardType = type;
    assistTxf.keyboardType = type;
    [assistTxf becomeFirstResponder];
    saveButton.enabled = content.length>0;
    
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        
            if (!shouldDismiss) {
                [inputView becomeFirstResponder];
            }
        
    }];
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self saveContent];
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    saveButton.enabled = textView.text.length>0;
}



@end
