//
//  DDInputAccessoryView.h
//  XiaoOO
//
//  Created by hf on 2017/1/17.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DDInputAccessoryBlock)(NSString *contentStr);

@interface DDInputAccessoryView : NSObject


+ (void)showBlock:(DDInputAccessoryBlock)block;


+ (void)showKeyboardType:(UIKeyboardType)type
                   Block:(DDInputAccessoryBlock)block;

+ (void)showKeyboardType:(UIKeyboardType)type content:(NSString *)content Block:(DDInputAccessoryBlock)block;

- (void)showKeyboardType:(UIKeyboardType)type
                 content:(NSString *)content
                   Block:(DDInputAccessoryBlock)block;

@end
