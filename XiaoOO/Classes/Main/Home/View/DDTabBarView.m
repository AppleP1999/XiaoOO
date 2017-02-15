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
//static const CGFloat  img_conter_ =  ;
@interface DDTabBarView ()
@property  (nonatomic ,weak) UIButton *btn_Left;
@property  (nonatomic ,weak) UIButton *btn_Rithg;
@property  (nonatomic,weak) UIButton *btn_conter;
@property  (nonatomic,weak)DDLevelMeterView * img_left_meterView;
@property  (nonatomic,weak)DDLevelMeterView * img_rithg_meterView;
@end
@implementation DDTabBarView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = RGBA(99, 98, 99, 0.2);
        [self initButtons];
        [self initImgview];
        [self set_Constraints];
        //点击事件
        [self Allactions];
   
        
    }
    return self;
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
    btn_left.backgroundColor = [UIColor grayColor];
    [self addSubview:btn_left];
    [self.btn_Left setBackgroundImage:GetImage(@"nav_arrow") forState:UIControlStateNormal];
    self.btn_Left = btn_left;
   
    UIButton * btn_rithg = [[UIButton alloc]init];
    [btn_rithg addTarget:self action:@selector(func_btn_rithg) forControlEvents:UIControlEventTouchUpInside];
    [self.btn_Rithg setImage:GetImage(@"nav_arrow") forState:UIControlStateNormal];

    btn_rithg.backgroundColor = [UIColor grayColor];
    [self addSubview:btn_rithg];
    self.btn_Rithg = btn_rithg;
   
   
    UIButton * btn_conter = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    btn_conter.backgroundColor = [UIColor redColor];
    [btn_conter setBackgroundImage:GetImage(tabbar_head) forState:UIControlStateNormal];
    [self addSubview:btn_conter];
    self.btn_conter = btn_conter;
    
    
}
-(void)Allactions
{

    [[self.btn_Left rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"btn_Left----Click---- Click ----Click ");
        
        NSArray *dataArray =  @[@"4",@"3",@"2",@"1",@"4",@"3",@"2",@"1",@"3",@"2",@"1"]; //[NSArray arrayWithObjects:@"小视频", @"拍照",@"从手机相册选择",@"取消",nil];
        
        CCPActionSheetView *actionSheetView = [[CCPActionSheetView alloc]initWithActionSheetArray:dataArray];
        
        [actionSheetView cellDidSelectBlock:^(NSString *indexString, NSInteger index) {
            NSLog(@"  view -  %@  ",indexString);
        
        }];

    }];
    
    
}
-(void)set_Constraints
{
    [self.btn_Left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
        make.left.mas_equalTo(12);
        
    }];
    [self.btn_Rithg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(-12);
    }];
    [self.btn_conter mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(10);
//        make.width.mas_equalTo(40);
//        make.height.mas_equalTo(40);
        make.size.mas_equalTo(self.btn_conter.currentBackgroundImage.size);
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self);
    }];
    [self.img_left_meterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(55);
        make.centerY.mas_equalTo(self);
        make.centerX.mas_equalTo(self).offset(img_conter_h);
    }];
    
    [self.img_rithg_meterView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(10);
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
