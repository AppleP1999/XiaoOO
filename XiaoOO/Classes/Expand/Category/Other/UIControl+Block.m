//
//  UIButton+Block.m
//  runtime
//
//  Created by hf on 2017/2/21.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "UIControl+Block.h"
#import <objc/runtime.h>
static NSString *keyOfMethod;
static NSString *keyOfBlock;
static NSString *keyOfSelf;

@implementation UIControl (Block)
//+ (UIButton *)createBtnWithFrame:(CGRect)frame title:(NSString *)title actionBlock:(ActionBlock)actionBlock{
//    UIButton *button = [[UIButton alloc]init];
//    button.frame = frame;
//    [button setTitle:title forState:UIControlStateNormal];
//    [button addTarget:button action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    objc_setAssociatedObject (button , &keyOfMethod, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
//    
//    return button;
//}
//
-(void) block_TouchUpInside_Action:(ActionBlock)b
{
    if (b) {
        objc_setAssociatedObject(self, &keyOfSelf, b, OBJC_ASSOCIATION_COPY);
        [self addTarget:self action:@selector(Click_block) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)Click_block
{
    ActionBlock block = objc_getAssociatedObject(self, &keyOfSelf);
    block(self);
}
- (void)buttonClick:(UIButton *)button{
    
    //通过key获取被关联对象
    //objc_getAssociatedObject(id object, const void *key)
    ActionBlock block1 = (ActionBlock)objc_getAssociatedObject(button, &keyOfMethod);
    if(block1){
        block1(button);
    }
    
    ActionBlock block2 = (ActionBlock)objc_getAssociatedObject(button, &keyOfBlock);
    if(block2){
        block2(button);
    }
}


//- (void)setActionBlock:(ActionBlock)actionBlock{
//    objc_setAssociatedObject (self, &keyOfBlock, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC );
//}
//
//- (ActionBlock)actionBlock{
//    return objc_getAssociatedObject (self ,&keyOfBlock);
//}
@end
