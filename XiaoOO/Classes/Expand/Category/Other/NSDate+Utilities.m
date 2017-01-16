//
//  NSDate+NSDate_Utilities.m
//  XiaoOO
//
//  Created by hf on 2017/1/16.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)
- (NSString *) stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    //    formatter.locale = [NSLocale currentLocale]; // Necessary?
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}
@end
