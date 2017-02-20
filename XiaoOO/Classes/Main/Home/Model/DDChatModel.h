//
//  DDChatModel.h
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    MyMessageType=0,//自己的消息
    VDChatMessage, //别人的消息
} MessageType;

typedef void (^black_cellHeight)();

@interface DDChatModel : NSObject
@property(nonatomic,copy)NSString *  textString;
@property (nonatomic,assign) MessageType messageType;
@property(nonatomic,copy)black_cellHeight  block_celH;
@property(nonatomic,assign) CGFloat model_h;
@end
