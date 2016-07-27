//
//  ErrorManage.m
//  GuoJiaJia
//
//  Created by 盛夏光年 on 15-6-2.
//  Copyright (c) 2015年 MQ. All rights reserved.
//

#import "ErrorManage.h"

@implementation ErrorManage
+ (NSString *) showErrorMesWithOpcode:(NSString *) opcode
{
    NSString *tempStr = [NSString string];
    if ([opcode isEqualToString:@"9999"])
    {
        
        tempStr = @"请求失败";
    }
    if ([opcode isEqualToString:@"6000"])
    {

        tempStr = @"参数缺失";
    }
    if ([opcode isEqualToString:@"6001"])
    {

        tempStr = @"签名验证失败";
    }
    if ([opcode isEqualToString:@"6002"])
    {

        tempStr = @"session失效";
    }
    if ([opcode isEqualToString:@"6003"])
    {

        tempStr = @"验证码错误";
    }
    if ([opcode isEqualToString:@"6004"])
    {

        tempStr = @"验证码失效";
    }
    if ([opcode isEqualToString:@"6005"])
    {

        tempStr = @"短信发送申请过于频繁";
    }
    if ([opcode isEqualToString:@"6006"])
    {

        tempStr = @"已达到本日短信发送上限";
    }if ([opcode isEqualToString:@"6007"])
    {

        tempStr = @"验证码已发送，请稍后再试";
    }if ([opcode isEqualToString:@"6008"])
    {
        tempStr = @"请求无数据";
    }
    if ([opcode isEqualToString:@"6009"])
    {

        tempStr = @"分页无数据";
    }
    if ([opcode isEqualToString:@"6010"])
    {

        tempStr = @"商品已下架";
    }
    if ([opcode isEqualToString:@"6011"])
    {
        tempStr = @"手机号码格式不正确";
    }
    return tempStr;
}
@end
