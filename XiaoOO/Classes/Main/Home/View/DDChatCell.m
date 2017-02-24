//
//  DDChatCell.m
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDChatCell.h"

@interface DDChatCell ()
//名字
@property(nonatomic,weak)UILabel * lab_name;
//头像
@property(nonatomic,weak)UIImageView * imgView_icon;
//背景
@property(nonatomic,weak)UIImageView * imgView_backView;
//文字
@property(nonatomic,weak)UILabel * lab_text;
@property(strong,nonatomic) DDChatModel * model;


@end

@implementation DDChatCell


-(void)setModel:(DDChatModel *)model
{
    if (model) {
        
        CGFloat wid = Main_Screen_Width - (17+34+11);
        CGSize  size =  [self sizeWithFont:self.lab_text.font maxSize:CGSizeMake(wid, 2000) textString:model.textString];
        self.lab_text.text = model.textString;
        
        
        [self  setUIframe:size :model.messageType];
    }
    _model = model;
  
    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = COLOR_RGB(0x498BFF,0.1);

        [self initUI];
        
    }
    return self;
}
-(void)initUI
{
    UIImageView * imgView_icon = [[UIImageView alloc]init];
//    imgView_icon.userInteractionEnabled = YES;
    imgView_icon.layer.cornerRadius = imgView_icon.frame.size.width / 2;
    imgView_icon.layer.masksToBounds = YES;
    
    UILabel * lab_name = [[UILabel alloc]init];
    lab_name.font = [UIFont systemFontOfSize:12];
    
    //    创建气泡
    UIImageView * imgView_backView = [[UIImageView alloc]init];
    
    [self.contentView addSubview:imgView_icon];
    [self.contentView addSubview:lab_name];
    [self.contentView addSubview:imgView_backView];
    self.imgView_backView= imgView_backView;
    self.imgView_icon = imgView_icon;

    //    self.lab_name=lab_name;
    
    UILabel * lab_text = [[UILabel alloc]init];
    lab_text.numberOfLines = 0;
    lab_text.font =   FONT_PingHei_Light(18);//[UIFont systemFontOfSize:17.0f];
    [lab_text setTextColor:HEXCOLOR(0xffffff)];
    
    [imgView_backView addSubview:lab_text];
    self.lab_text = lab_text;
    
    [self.imgView_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(34, 34));
 
        make.bottom.equalTo(self.imgView_backView.mas_bottom).offset(-2);
    }];
    
    [self.lab_text mas_makeConstraints:^(MASConstraintMaker *make) {
        
     
        make.bottom.equalTo(self.imgView_backView.mas_bottom).offset(-10);;
        
    }];
    [self.imgView_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
 
        make.height.equalTo(self.lab_text.mas_height).offset(10);
  
        
    }];

}
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize textString:(NSString *)textString
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [textString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;

}

-(void)refreshCell:(DDChatModel *)model
{
    self.model = model;
//    return;
    //    获取文本高度

    
    
}
- (void) setUIframe:(CGSize) size :(MessageType)type;
{
    if (size.width==0) {
        size.height = 18;
        size.width = 44;
    }
    if (type == MyMessageType) {
        self.imgView_icon.image = GetImage(@"dialog_user_head");
        self.imgView_backView.image = GetImage(@"dialog_ask");
    }else if (type == VDChatMessage){
        self.imgView_icon.image = GetImage(@"dialog_tinyo_head");
        self.imgView_backView.image = GetImage(@"dialog_answer");
    }
    
    
    [self.lab_text mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(size.width-40);
        if (type == MyMessageType) {
        make.right.equalTo(self.imgView_icon.mas_left).offset(-15);
        }else if (type == VDChatMessage){
        make.left.equalTo(self.imgView_icon.mas_right).offset(15);
        }
//        make.bottom.equalTo(self.imgView_backView.mas_bottom).offset(-10);;
        
    }];
    
    [self.imgView_icon mas_updateConstraints:^(MASConstraintMaker *make) {
        
//        make.size.mas_equalTo(CGSizeMake(34, 34));
//        make.width.mas_equalTo(size.width-40);
        if (type == MyMessageType) {
            make.right.mas_equalTo(-12);
            
        }else if (type == VDChatMessage){
            make.left.mas_equalTo(12);
        }
        
//        make.bottom.equalTo(self.imgView_backView.mas_bottom).offset(-2);
    }];

        [self.imgView_backView mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(size.width);
        make.height.mas_equalTo(size.height+20);
            make.height.equalTo(self.lab_text.mas_height).offset(10);

        if (type == MyMessageType) {
            make.right.equalTo(self.imgView_icon.mas_left).offset(10);
            
        }else if (type == VDChatMessage){
            make.left.equalTo(self.imgView_icon.mas_right).offset(-10);
        }
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
        
    }];
    UIImage * image = self.imgView_backView.image;
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    self.imgView_backView.image = image;
    self.imgView_backView.clipsToBounds = YES;
    self.cellHeight = size.height+30;
//    !self.black_celH ? :self.black_celH(size.height+30);
}
-(void)layoutSubviews
{
    [super layoutSubviews];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
