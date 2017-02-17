//
//  DDSettingViewVC.m
//  XiaoOO
//
//  Created by hf on 2017/2/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDSettingViewVC.h"
#import "DDSettingCell.h"
@interface DDSettingViewVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) NSArray *arrayText;
@end

@implementation DDSettingViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setBackImage];
    [self set_arrayText];
    [self set_tableView];
    
}
-(void)setBackImage
{
    UIImageView * backView= [[UIImageView alloc]initWithImage:GetImage(Img_bg_img)];
    [self.view addSubview: backView];
//    self.view = backView;
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
//        make.size.mas_equalTo(Main_Screen_Bounds.size);
    }];
}
-(void)set_arrayText
{
    self.arrayText = @[@"IP地址",@"唤醒音频保存",@"打断音频保存",@"识别结果输出"];
    
}
-(void)set_tableView
{
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [tableView setBackgroundColor:[UIColor clearColor]];
    tableView.scrollEnabled  = NO;
    tableView.delegate   = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(Main_Screen_Bounds.size);
        make.top.equalTo(self.navigationController.view);
    }];
}

#pragma maek tableView delgate 
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"setting_Identifier";
    DDSettingCell *  cell = [tableView dequeueReusableCellWithIdentifier:str ];
    if (!cell) {
        cell = [[DDSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.indexpath= indexPath;
    cell.titile = self.arrayText[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayText.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 63;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
@end
