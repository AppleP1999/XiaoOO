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
#import "DDSettingViewVC.h"

#import "DDTextFieldButton.h"
@interface DDMianViewController ()

@property (nonatomic, weak)UIButton * btn_shart;
@property (nonatomic, weak) DDTabBarView * buttomView;
@property (nonatomic,weak ) UIButton  * btn_set;
@property (nonatomic, assign)BOOL   no;
@property(nonatomic,copy)NSString *  test;
@end

@implementation DDMianViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.no= NO;
    [self setBackImage_Buttons];
//    [self initUI];
    [self set_UIConstraints];
    [self All_action];

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
        
        NSArray *familyNames = [UIFont familyNames];
        for( NSString *familyName in familyNames )
        {
            NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
            for( NSString *fontName in fontNames )
            {
                printf( "\tFont: %s \n", [fontName UTF8String] );
            }
        }
        NSLog(@"-Click ---- ------Click - %@" ,self.btn_shart);
//        [v updateImg:0.1];
        
    }];
    [self.view addSubview:btn];
    
    
    
    DDTextFieldButton * ttt = [DDTextFieldButton dropdown];
                                
    [self.view addSubview:ttt];
    [ttt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 50));
        make.top.left.mas_equalTo(30);
    }];
}

-(void)All_action
{
    [[self.btn_shart rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"Click 开启 VD ");
        
        Class class_vc = NSClassFromString(@"DDChatVC");
        id vc = [[class_vc alloc]init];

        
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
    [[self.btn_set rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"Click -- 设置");
        DDSettingViewVC * ddsettingVC = [[DDSettingViewVC alloc]init];
        ddsettingVC.title = @"开发者设置";
        [self.navigationController pushViewController:ddsettingVC animated:YES];
    }];
}
-(void)setBackImage_Buttons
{
 
    [self setImgView_bg];
    UIButton * btn_shart = [[UIButton alloc]init];
//    btn_shart.backgroundColor = [UIColor redColor];
    [btn_shart setImage:GetImage(Img_home_tinyo) forState:UIControlStateNormal];
    [self.view addSubview:btn_shart];
    self.btn_shart = btn_shart;
    
    UIButton * btn_set = [[UIButton alloc]init];
    btn_set.backgroundColor = [UIColor grayColor];
    [btn_set setTitle:@"设置" forState:0];
    
    [self.view addSubview:btn_set];
    self.btn_set = btn_set;
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

//    [_buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.left.right.mas_equalTo(0);
//        make.height.mas_equalTo(60);
//    }];
    
    [self.btn_shart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.btn_shart.currentImage.size);
        make.centerX.mas_equalTo(self.view).offset(45) ;
        make.top.mas_equalTo(setHeight(141)) ;
        
    }];
    [self.btn_set mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

}
-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    // Dispose of any resources that can be recreated.
}



@end
