//
//  DDSettingCell.m
//  XiaoOO
//
//  Created by hf on 2017/2/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDSettingCell.h"
#import "CCPActionSheetView.h"

#import "GXHUserDefaults+appSetting.h"

@interface DDSettingCell ()

@property (nonatomic, weak) UISwitch * Switch;
@property (nonatomic, weak) UILabel  * lab_text;
@property (nonatomic, strong)UILabel  * lab_desc;
@property(nonatomic,strong)UIButton  * btn_edit_ip;
@property(nonatomic,strong)NSMutableArray * dataArray;

@end
@implementation DDSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(UILabel *)lab_desc{
    if (!_lab_desc) {
        self.lab_desc = [[UILabel alloc]initWithFrame:CGRectZero];
        self.lab_desc.textColor = HEXCOLOR(0X677790);
        [self.lab_desc setFont:FONT_PingHei_Text(20)];
        self.lab_desc.text = @"192.168.1.1";
    }
    
    return _lab_desc;
}
-(UIButton *)btn_edit_ip{
    if (!_btn_edit_ip) {
        self.btn_edit_ip = [[UIButton alloc]initWithFrame:CGRectZero];
        [self.btn_edit_ip setBackgroundImage:GetImage(@"set_edit") forState:0];
        self.btn_edit_ip.size = self.btn_edit_ip.currentBackgroundImage.size;
    }
    return _btn_edit_ip;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
   
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = COLOR_RGB(0x498BFF,0.3);
    }
    return self;
}
-(void)setIndexpath:(NSIndexPath *)indexpath
{
    _indexpath = indexpath;
    if (indexpath.row==0) {

        [self.contentView addSubview:self.lab_desc];
  
        
    }
}
-(void)initUI
{
    UISwitch * Switch = [[UISwitch alloc]init];
    Switch.onImage = GetImage(@"set_toggle_on");
    Switch.tintColor = RGB(0, 191, 241);
    [Switch setOnTintColor:RGB(0, 191, 241)];
    self.accessoryView = Switch;
    self.Switch = Switch;
    
    UILabel * lab_text = [[UILabel alloc]initWithFrame:CGRectZero];
    [lab_text setFont:FONT_PingHei_Text(18)];
    lab_text.textColor = [UIColor whiteColor];
    [self.contentView addSubview:lab_text];
    self.lab_text = lab_text;
    
    if (self.indexpath.row==0) {
        self.accessoryView = self.btn_edit_ip;
        [self.contentView addSubview:self.lab_desc];
    }
    
    
}
-(void)set_constraints
{
    [self.lab_text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12.0);
        make.right.mas_equalTo(-10.0);
        make.top.mas_equalTo(25.0);
    }];
   
    
    if (_lab_desc) {
        [self.lab_desc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.btn_edit_ip.mas_left).with.offset(-12);
            make.centerY.equalTo(self.contentView.mas_centerY);
            
        }];
    }
}
-(void)all_action
{
    
    [self.Switch block_TouchUpInside_Action:^(UISwitch* x) {
        NSLog(@"Switch -%ld ",(long)x.on);
        
        !self.block_btn_SwitchOn ?:self.block_btn_SwitchOn(self.indexpath.row,x.on);
    }];
    
  
     [self.btn_edit_ip block_TouchUpInside_Action:^(UIButton *button) {
        NSLog(@"- btn_edit_ip  -");
        !self.block_btn_SwitchOn ?:self.block_btn_SwitchOn(self.indexpath.row,1);
     }];
 

}
-(void)setTitile:(NSString *)titile
{
    _titile = titile;
    
    
    
    [self initUI];
    self.lab_text.text = titile;
    [self all_action];
//    [self set_constraints];
 
}
-(void)setDescString:(NSString *)descString
{
    _descString = descString;
    self.lab_desc.text = descString;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self set_constraints];
}
@end
