//
//  DDChatCell.h
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DDChatModel.h"

typedef void (^black_cellHeight)();
@interface DDChatCell : UITableViewCell

- (void)refreshCell:(DDChatModel *)model;
@property (nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,copy)black_cellHeight  black_celH;
@end
