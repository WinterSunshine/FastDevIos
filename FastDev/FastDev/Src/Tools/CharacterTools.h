//
//  CharacterTools.h
//  Studio
//
//  Created by edison on 16-3-24.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterTools : NSObject
+(NSString *) urlEncode:(NSString *) input;
+(NSString *) encodeBase64:(NSString *)plainString;
//含有非法的字符
+(BOOL)isTextViewString:(NSString *)keyword;
//手机号码正则表达式
+(BOOL)isMobileNumber:(NSString *)mobileNum;
//是否含中文
+(BOOL)IsChinese:(NSString *)str;
//是否纯数字
+(BOOL)isAllNum:(NSString *)string;
@end
