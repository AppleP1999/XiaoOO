//
//  DDTabBarView.h
//  XiaoOO
//
//  Created by hf on 2017/1/12.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^block_Click)();

@interface DDTabBarView : UIView


/**
 button 点击事件
 @param btnL 点击 左边回调
 @param btnR 点击 右边回调
 */
-(void) block_Click_btnL:(block_Click)btnL btnR:(block_Click)btnR;
@end
