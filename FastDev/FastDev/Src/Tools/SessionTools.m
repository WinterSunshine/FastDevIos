//
//  SessionTools.m
//  Studio
//
//  Created by edison on 16-3-21.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import "SessionTools.h"


@implementation SessionTools

static NSString *SESSION = @"session";
static NSString *STUDIOName = @"studioName";
static NSString *DEVICENo = @"deviceNo";
static NSString *USERAccount = @"userAccount";
static NSString *FIRSTLoading = @"FirstLoading";


+(NSString *) getSession
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:SESSION];
}

+(void) putSession:(NSString *) session
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:session forKey:SESSION];
}

+(void) clearSession
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:SESSION];
}

+(NSString *) getstudioName
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:STUDIOName];
}
+(void) putstudioName:(NSString *)studioName
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:studioName forKey:STUDIOName];
}
+(NSString *) getdeviceNo
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:DEVICENo];
}
+(void) putdeviceNo:(NSString *)deviceNo
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:deviceNo forKey:DEVICENo];
}
+(NSString *) getuserAccount
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:USERAccount];
}
+(void) putuserAccount:(NSString *)userAccount
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:userAccount forKey:USERAccount];
}
+(NSString *) getFirstLoading
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:FIRSTLoading];
}
+(void) putFirstLoading:(BOOL)FirstLoading
{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setBool:FirstLoading forKey:FIRSTLoading];
}

@end

