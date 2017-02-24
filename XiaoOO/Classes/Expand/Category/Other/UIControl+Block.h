//
//  UIButton+Block.h
//  runtime
//
//  Created by hf on 2017/2/21.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ActionBlock)(id obj);

@interface UIControl (Block)
@property (nonatomic,copy) ActionBlock actionBlock;

//+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock;
-(void) block_TouchUpInside_Action:(ActionBlock)b;
@end
