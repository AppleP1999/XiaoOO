//
//  DDLevelMeterView.m
//  XiaoOO
//
//  Created by hf on 2017/2/15.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDLevelMeterView.h"

static const NSString * waveline_9  = @"waveline.9";

@interface DDLevelMeterView ()

@end

@implementation DDLevelMeterView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        for (NSInteger i = 0 ; i<9; i++) {
            UIImageView  * img = [[UIImageView alloc]initWithImage:GetImage(waveline_9)];
            img.width = 2;
            img.height= 5;
            [self addSubview:img];
        }
        [self set_Constraints];

    }
    return self;
}
-(void)updateImg:(CGFloat) s
{
    CGFloat imgH =  5;
    NSInteger y = 0;
    for (UIView * v in self.subviews) {
        if (y<5) {
            imgH+=10.0;
        }else{
        imgH-=10.0;
        }
        [v mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(imgH);
            make.centerY.mas_equalTo(self);
        }];
        
        y++;
    }
}

-(void)set_Constraints
{
    NSInteger i = 0;
    CGFloat  imgX = 0;
    for (UIView * view in self.subviews) {
        
        if ([view isKindOfClass:[UIImageView class]]) {
            
            
                if(i!=0)
                imgX += (view.x+5+view.width);
                view.x  = imgX;
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(3, 5));
                    make.left.mas_equalTo(imgX);
                    make.centerY.mas_equalTo(self);

                }];
            i++;
        }
    }
}
@end
