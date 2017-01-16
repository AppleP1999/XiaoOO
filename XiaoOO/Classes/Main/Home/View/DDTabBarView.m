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
@interface DDTabBarView ()
@property  (nonatomic ,weak) UIButton *btn_Left;
@property  (nonatomic ,weak) UIButton *btn_Rithg;
@end
@implementation DDTabBarView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        [self initButtons];
        [self set_UI];
        [self actions];
    }
    return self;
}

-(void)initButtons
{
    UIButton * btn_left = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    [btn_left addTarget:self action:@selector(func_btn_left) forControlEvents:UIControlEventTouchUpInside];
    btn_left.backgroundColor = [UIColor redColor];
    [self addSubview:btn_left];
    self.btn_Left = btn_left;
    UIButton * btn_rithg = [[UIButton alloc]init];
    [btn_rithg addTarget:self action:@selector(func_btn_rithg) forControlEvents:UIControlEventTouchUpInside];
    btn_rithg.backgroundColor = [UIColor redColor];
    [self addSubview:btn_rithg];
    self.btn_Rithg = btn_rithg;
   
   
    
   
    
    
}
-(void)actions
{

    
    [[self.btn_Left rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"----Click---- Click ----Click ");
        
        NSArray *dataArray =  @[@"4",@"3",@"2",@"1",@"4",@"3",@"2",@"1",@"3",@"2",@"1"]; //[NSArray arrayWithObjects:@"小视频", @"拍照",@"从手机相册选择",@"取消",nil];
        
        CCPActionSheetView *actionSheetView = [[CCPActionSheetView alloc]initWithActionSheetArray:dataArray];
        
        [actionSheetView cellDidSelectBlock:^(NSString *indexString, NSInteger index) {
            NSLog(@"  view -  %@  ",indexString);
        
        }];

    }];
}
-(void)set_UI 
{
    [self.btn_Left mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(10);
    }];
  
}
-(void)func_btn_rithg
{
    
}
-(void)func_btn_left
{}
@end
