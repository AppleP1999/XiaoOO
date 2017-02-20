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
    
    [[self.Switch rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UISwitch* x) {
        NSLog(@"Switch -%@ Switch",x);
        
        !self.block_btn_SwitchOn ?:self.block_btn_SwitchOn(self.indexpath.row,x.on);
    }];
    [[self.btn_edit_ip rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton* x) {
        NSLog(@"- btn_edit_ip  -");
        !self.block_btn_SwitchOn ?:self.block_btn_SwitchOn(self.indexpath.row,1);

//<<<<<<< Updated upstream
//=======
//        
//        
//        [GXHUserDef.Array_ips enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [arr addObject:obj];
//        }];
//        [arr addObject:@"1"];
//        NSLog(@"gxh_fetchCurrentKeyValues ,%@",[GXHUserDef gxh_fetchCurrentKeyValues]);
//        
//        
//        CCPActionSheetView *actionSheetView = [[CCPActionSheetView alloc]initWithActionSheetArray:arr];
//        
//       __block NSMutableArray * array = [NSMutableArray array];
//        [actionSheetView cellDidSelectBlock:^(NSString *indexString, NSInteger index) {
//            NSLog(@"  view -  %@  ",indexString);
//            if (index==0) {
//                [DDInputAccessoryView showBlock:^(NSString *contentStr) {
//                    
//                    userDefaults = [NSUserDefaults standardUserDefaults];
//                    
//                    [array addObject:contentStr];
//                    GXHUserDef.Array_ips = array;
////                    [userDefaults setObject:array forKey:@"settingDataArray_ip"];
////                    [userDefaults synchronize];
//
//                }];
//            }
//        }];
// 
//>>>>>>> Stashed changes
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
