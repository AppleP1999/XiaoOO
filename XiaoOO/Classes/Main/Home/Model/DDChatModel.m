//
//  DDChatModel.m
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDChatModel.h"

@implementation DDChatModel
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize textString:(NSString *)textString
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [textString boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
}
-(void)setTextString:(NSString *)textString
{
    _textString =textString;
    CGFloat wid = Main_Screen_Width - (17+34+11);
    CGSize  size =  [self sizeWithFont:FONT_PingHei_Light(18) maxSize:CGSizeMake(wid, 2000) textString:textString];
    self.model_h = size.height+55;
    !self.block_celH ?:self.block_celH(size.height+30);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
 
    }
    return self;
}
@end
