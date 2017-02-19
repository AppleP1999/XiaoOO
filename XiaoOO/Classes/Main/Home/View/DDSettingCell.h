//
//  DDSettingCell.h
//  XiaoOO
//
//  Created by hf on 2017/2/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^block_aictions_btn_SwitchOn)(NSInteger ind ,BOOL b);


@interface DDSettingCell : UITableViewCell
@property(nonatomic,strong)NSIndexPath * indexpath;
@property(nonatomic,copy)NSString *  titile;
@property(nonatomic,copy)NSString  * descString;
@property(nonatomic,copy) block_aictions_btn_SwitchOn  block_btn_SwitchOn;

@end
