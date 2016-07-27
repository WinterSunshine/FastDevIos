//
//  RuleTools.h
//  GameLeveling
//
//  Created by edison on 16-7-9.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XTableView.h"

@class XTableView;

@interface RuleTools : NSObject
+(void) checkTextFieldEmpty:(UITextField *)field toast:(NSString *)toast;
+(void) checkPhoneRegex:(NSString *)phone;
+(void) checkQQRegex:(NSString *)qq ; 
+(void) checkSmsCodeRegex:(NSString *)smsCode;
+(void) checkNoFirstData:(XTableView *)xTable errorMsg:(NSString *)error;
+(void) checkNoMoreData:(UIViewController *)controller errorMsg:(NSString *)error;
@end
