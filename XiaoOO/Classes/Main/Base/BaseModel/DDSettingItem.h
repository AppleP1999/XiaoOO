//
//  DDSettingItem.h
//  XiaoOO
//
//  Created by hf on 2017/1/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DDSettingItemOption)();
@interface DDSettingItem : NSObject
@property(nonatomic,copy)NSString * Title;
@property(nonatomic,copy)NSString * iconStirng;
@property(nonatomic,strong)NSString * Subtitle;
@property(nonatomic,copy)DDSettingItemOption  option;
+(instancetype)itemWithTile:(NSString *)t SubTitle:(NSString *)sTitle iconString:(NSString *)i;
+(instancetype)itemWithTile:(NSString *)t iconString:(NSString *)i;
+(instancetype)itemWithTile:(NSString *)t SubTitle:(NSString *)sTitle;
+(instancetype)itemWithTile:(NSString *)t;
+(instancetype) item;
@end
