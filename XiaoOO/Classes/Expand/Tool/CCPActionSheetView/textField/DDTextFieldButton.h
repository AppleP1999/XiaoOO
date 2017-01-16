//
//  DDTextFleldButton.h
//  CCPActionSheetDemo
//
//  Created by hf on 2017/1/3.
//  Copyright © 2017年 C CP. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^targetBlock)();
typedef void (^targetTextStringBlock)(NSString*str);
@interface DDTextFieldButton : UIView

+(instancetype)dropdown;
@property(nonatomic,copy)NSString  * textSting;
@property(nonatomic,copy)targetBlock  targetBlock;
@property(nonatomic,copy)targetTextStringBlock  TextStringBlock;
-(void)addTarget:(targetBlock)b;
-(void )returnTextfiled:(targetTextStringBlock)b;

@end
