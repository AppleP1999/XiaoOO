//
//  CCPActionSheetCell.m
//  CCPActionSheetDemo
//
//  Created by C CP on 16/7/22.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import "CCPActionSheetCell.h"

@interface CCPActionSheetCell ()



@end

@implementation CCPActionSheetCell
-(DDTextFieldButton *)text_btn
{
    if (!_text_btn) {
        self.text_btn = [DDTextFieldButton dropdown];
        
        [self.contentView addSubview:self.text_btn];
    
        
    }
    
    return _text_btn;
}
-(void)setIndexpath:(NSIndexPath *)indexpath
{
    _indexpath= indexpath;
    if (self.indexpath.row==0) {
        
        
        self.infoLabel.hidden = YES;
        
        [self.text_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.centerX.equalTo(self.contentView);
            make.width.equalTo(self.contentView);
            
        }];
    }
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
  
    
    
}
@end
