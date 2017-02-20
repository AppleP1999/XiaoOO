//
//  UIViewController+backImgView.m
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "UIViewController+backImgView.h"

@implementation UIViewController (backImgView)
-(void) setImgView_bg
{

    UIImageView * backView= [[UIImageView alloc]initWithImage:GetImage(Img_bg_img)];
    [self.view addSubview: backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_equalTo(0);
    }];
}

@end
