//
//  TimeTools.m
//  GameLeveling
//
//  Created by edison on 16-7-9.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import "TimeTools.h"

@implementation TimeTools

+(NSString *)getCurrentTime
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    return timeString;
}

+(NSString *)getCurrentDay
{
    NSDateFormatter *format =  [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDay = [format stringFromDate:[NSDate date]];
    return currentDay;
}

+(NSString *)getBeforeOrAfterDay:(NSInteger)day
{
    NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
    NSDateFormatter *format =  [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate* nowDate = [NSDate date];
    NSDate* theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*day ];
    return  [format stringFromDate:theDate];
}

@end
