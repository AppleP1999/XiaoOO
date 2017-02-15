//
//  DDMianViewController.m
//  xiaoO
//
//  Created by hf on 2017/1/3.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDMianViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "DDTabBarView.h"
#import "DDInputAccessoryView.h"
#import "DDLevelMeterView.h"
static const  NSString *  DD_Mind_bg_img = @"bg_img";
static const  NSString *  DD_Mind_home_tinyo   = @"home_tinyo";
@interface DDMianViewController ()

@property (nonatomic, weak)UIButton * btn_shart;
@property (nonatomic, weak) DDTabBarView * buttomView;
@property (nonatomic, assign)BOOL   no;
@property(nonatomic,copy)NSString *  test;
@end

@implementation DDMianViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.no= NO;
    [self setBackImage];
    [self initUI];
    [self set_UIConstraints];

    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(60, setHeight(141), 120, 80)];
    
    UIImage * image1 = [UIImage imageNamed:@"arrow_down_icon"];
    UIImage * image2 = [UIImage imageNamed:@"arrow_up_icon"];
 
    [btn setImage:image1 forState:UIControlStateNormal];
    [btn setImage:image2 forState:UIControlStateSelected];
     btn.backgroundColor = [UIColor redColor];
    btn.size = image1.size;
    DDLevelMeterView * v = [[DDLevelMeterView alloc]init];
    v.size = CGSizeMake(200, 40);
    v.x = 80;
    v.y = 90;
    [self.view addSubview:v];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton * x)
    {
        
        NSLog(@"-Click ---- ------Click - %@" ,self.btn_shart);
        [v updateImg:0.1];
        
    }];
    [self.view addSubview:btn];
    
    
    
    
    
}
-(void)setBackImage
{
    UIImageView * backView= [[UIImageView alloc]initWithImage:GetImage(DD_Mind_bg_img)];
    [self.view addSubview: backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
    UIButton * btn_shart = [[UIButton alloc]init];
//    btn_shart.backgroundColor = [UIColor redColor];
    [btn_shart setImage:GetImage(DD_Mind_home_tinyo) forState:UIControlStateNormal];
    [self.view addSubview:btn_shart];
    self.btn_shart = btn_shart;
}

-(void)animate:(UIButton *)x
{
    
}
-(void)xxxxx
{
    [DDInputAccessoryView showKeyboardType:UIKeyboardTypeDefault
                                   content:@""
                                     Block:^(NSString *contentStr){
                                         NSLog(@"contentStr - %@",contentStr);
                                     }];

}
-(void)initUI{
    DDTabBarView * buttomView = [[DDTabBarView alloc] init];
    [self.view addSubview: buttomView];
    self.buttomView = buttomView;
}
-(void)set_UIConstraints
{

    [_buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
    [self.btn_shart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.btn_shart.currentImage.size);
        make.centerX.mas_equalTo(self.view).offset(45) ;
        make.top.mas_equalTo(setHeight(141)) ;
    }];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    // Dispose of any resources that can be recreated.
}



@end
