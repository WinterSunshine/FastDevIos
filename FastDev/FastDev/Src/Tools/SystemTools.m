//
//  SystemTool.m
//  Studio
//
//  Created by edison on 16-4-7.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import "SystemTools.h"

@implementation SystemTools

+(NSString *)getAppVersion
{
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *app_Version = [infoDic objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"V%@", app_Version];
}

@end
