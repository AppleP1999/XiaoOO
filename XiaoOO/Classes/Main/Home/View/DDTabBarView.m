//
//  DDTabBarView.m
//  XiaoOO
//
//  Created by hf on 2017/1/12.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDTabBarView.h"

@interface DDTabBarView ()
@property  (nonatomic ,weak) UIButton *btn_Left;
@property  (nonatomic ,weak) UIButton *btn_Rithg;
@end
@implementation DDTabBarView


-(void)initButtons
{
    UIButton * btn_left = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    [btn_left addTarget:self action:@selector(func_btn_left) forControlEvents:UIControlEventTouchUpInside];
    btn_left.backgroundColor = [UIColor redColor];
    [self addSubview:btn_left];
    self.btn_Left = btn_left;
    UIButton * btn_rithg = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    [btn_rithg addTarget:self action:@selector(func_btn_rithg) forControlEvents:UIControlEventTouchUpInside];
    btn_rithg.backgroundColor = [UIColor redColor];
    [self addSubview:btn_rithg];
    self.btn_Rithg = btn_rithg;
   
    
    
}
-(void)set_UI
{
    [self.btn_Rithg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(10);
        make.height.mas_equalTo(10);
        make.left.mas_equalTo(10);
    }];
    [self.btn_Left mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}
-(void)func_btn_rithg
{}
-(void)func_btn_left
{}
@end
