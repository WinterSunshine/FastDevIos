//
//  TimeTools.h
//  GameLeveling
//
//  Created by edison on 16-7-9.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeTools : NSObject
+(NSString *)getCurrentTime;
+(NSString *)getCurrentDay;
+(NSString *)getBeforeOrAfterDay:(NSInteger)day;
@end
