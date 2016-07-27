//
//  RuleTools.m
//  GameLeveling
//
//  Created by edison on 16-7-9.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import "RuleTools.h"

@implementation RuleTools

+(void) checkTextFieldEmpty:(UITextField *)field toast:(NSString *)toast
{
    if ([field.text isEqualToString:@""] || !field.text)
    {
        @throw [[NSException alloc]initWithName:nil reason:toast userInfo:nil];
    }
}

+(void) checkPhoneRegex:(NSString *)phone
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if(![regextestmobile evaluateWithObject:phone])
    {
        @throw [[NSException alloc]initWithName:nil reason:@"请输入正确的手机号" userInfo:nil];
    }
}

+(void) checkQQRegex:(NSString *)qq
{
    NSString * QQ = @"^[1-9][0-9]{4,}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", QQ];
    if(![regextestmobile evaluateWithObject:qq])
    {
        @throw [[NSException alloc]initWithName:nil reason:@"请输入正确的QQ号" userInfo:nil];
    }

}

+(void) checkSmsCodeRegex:(NSString *) smsCode
{
    NSString * SMSCode = @"\\d{6}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", SMSCode];
    if(![regextestmobile evaluateWithObject:SMSCode])
    {
        @throw [[NSException alloc]initWithName:nil reason:@"请输入正确的验证码" userInfo:nil];
    }
}

+(void) checkNoFirstData:(XTableView *)xTable errorMsg:(NSString *)error
{
    if([error containsString:@"6016"])
    {
        NSArray *components = [error componentsSeparatedByString:@":"];
        [xTable showNoDataView:components[1]];
    }
}

+(void) checkNoMoreData:(UIViewController *)controller errorMsg:(NSString *)error
{
    if([error containsString:@"6017"])
    {
        NSArray *components = [error componentsSeparatedByString:@":"];
        [controller.view makeToast:components[1]];
    }
}

@end
