//
//  DDSettingItem.m
//  XiaoOO
//
//  Created by hf on 2017/1/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDSettingItem.h"

@implementation DDSettingItem
+(instancetype)itemWithTile:(NSString *)t SubTitle:(NSString *)sTitle iconString:(NSString *)i
{
    DDSettingItem * item = [DDSettingItem itemWithTile:t SubTitle:sTitle];
    item.iconStirng = i;
    return  item;
}
+(instancetype)itemWithTile:(NSString *)t iconString:(NSString *)i
{
    DDSettingItem * item = [DDSettingItem itemWithTile:t];
    item.Title = i;
    
    return  item;
}

+(instancetype)itemWithTile:(NSString *)t SubTitle:(NSString *)sTitle
{
    DDSettingItem * item = [DDSettingItem itemWithTile:t];
    item.Subtitle = sTitle;
    return  item;
}
+(instancetype)itemWithTile:(NSString *)t
{
    DDSettingItem * item = [DDSettingItem item];
    item.Title = t;
    return  item;
}
+(instancetype)item{
    return  [[self alloc]init];
}
@end
