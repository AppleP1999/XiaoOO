//
//  DDTabBarView.m
//  XiaoOO
//
//  Created by hf on 2017/1/12.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDTabBarView.h"
#import "CCPActionSheetView.h"
#import "Macros.h"
#import "DDInputAccessoryView.h"
#import "DDLevelMeterView.h"
#define img_conter_h (self.btn_conter.width/2+20)
//#import "UUInputAccessoryView.h"
static const NSString * tabbar_head = @"tabbar_head";
static const NSString * tabbar_backhome_normal = @"tabbar_backhome_normal";
static const NSString * tabbar_backhome_highlight = @"tabbar_backhome_highlight";
static const NSString * tabbar_help_normal = @"tabbar_help_normal";
static const NSString * tabbar_help_highlight = @"tabbar_help_highlight";


//static const CGFloat  img_conter_ =  ;
@interface DDTabBarView ()
@property  (nonatomic ,weak) UIButton *btn_Left;
@property  (nonatomic ,weak) UIButton *btn_Rithg;
@property  (nonatomic,weak) UIButton *btn_conter;
@property  (nonatomic,weak)DDLevelMeterView * img_left_meterView;
@property  (nonatomic,weak)DDLevelMeterView * img_rithg_meterView;
@property (nonatomic,copy)block_Click Click_btnL;
@property (nonatomic,copy)block_Click Click_btnR;
@end
@implementation DDTabBarView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGBA(0, 0, 0, 0);

        [self initButtons];
        [self  set_All_img];
        [self initImgview];
        [self set_Constraints];
        //点击事件
        [self Allactions];
   
        
    }
    return self;
}
-(void)set_All_img{
    [self.btn_Left setBackgroundImage:GetImage(tabbar_backhome_normal) forState:0];
    [self.btn_Left setBackgroundImage:GetImage(tabbar_backhome_highlight) forState:UIControlStateHighlighted];
    
    [self.btn_Rithg setBackgroundImage:GetImage(tabbar_help_normal) forState:0];
    [self.btn_Rithg setBackgroundImage:GetImage(tabbar_help_highlight) forState:UIControlStateHighlighted];
}

-(void)initImgview
{
    DDLevelMeterView * meterView = [[DDLevelMeterView alloc]init];
    [self addSubview:meterView];
    self.img_left_meterView = meterView;
    
    DDLevelMeterView * meterView2 = [[DDLevelMeterView alloc]init];
    [self addSubview:meterView2];
    self.img_rithg_meterView = meterView2;

}
-(void)initButtons
{
    UIButton * btn_left = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    [btn_left addTarget:self action:@selector(func_btn_left) forControlEvents:UIControlEventTouchUpInside];
//    btn_left.backgroundColor = [UIColor grayColor];
    [self addSubview:btn_left];
    [self.btn_Left setBackgroundImage:GetImage(@"nav_arrow") forState:UIControlStateNormal];
    self.btn_Left = btn_left;
   
    UIButton * btn_rithg = [[UIButton alloc]init];
    [btn_rithg addTarget:self action:@selector(func_btn_rithg) forControlEvents:UIControlEventTouchUpInside];
    [self.btn_Rithg setImage:GetImage(@"nav_arrow") forState:UIControlStateNormal];

//    btn_rithg.backgroundColor = [UIColor grayColor];
    [self addSubview:btn_rithg];
    self.btn_Rithg = btn_rithg;
   
   
    UIButton * btn_conter = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
//    btn_conter.backgroundColor = [UIColor redColor];
    [btn_conter setBackgroundImage:GetImage(tabbar_head) forState:UIControlStateNormal];
    [self addSubview:btn_conter];
    self.btn_conter = btn_conter;
    
    
}
-(void)Allactions
{
    [self.btn_Left block_TouchUpInside_Action:^(UIButton *button) {
        NSLog(@"btn_Left----Click---- Click ----Click ");
        self.Click_btnL();
    }];
    [self.btn_Rithg block_TouchUpInside_Action:^(UIButton *button) {
        self.Click_btnR();
    }];
    
    
}
-(void)block_Click_btnL:(block_Click)btnL btnR:(block_Click)btnR
{
    self.Click_btnR = btnR;
    self.Click_btnL = btnL;
}
-(void)set_Constraints
{
    [self.btn_Left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
//        make.size.mas_equalTo(self.btn_Left.currentBackgroundImage.size);
        make.left.mas_equalTo(12);
        
    }];
    [self.btn_Rithg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
//        make.size.mas_equalTo(self.btn_Left.currentBackgroundImage.size);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(-12);
    }];
    [self.btn_conter mas_makeConstraints:^(MASConstraintMaker *make) {
 
        make.size.mas_equalTo(self.btn_conter.currentBackgroundImage.size);
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    [self.img_left_meterView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(55);
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self).offset(img_conter_h);
    }];
    
    [self.img_rithg_meterView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.width.mas_equalTo(60);
        make.height.mas_equalTo(55);
        make.centerX.mas_equalTo(self).offset(-img_conter_h);
        make.centerY.mas_equalTo(self);

    }];


}
-(void)func_btn_rithg
{
    
}
-(void)func_btn_left
{}
@end
