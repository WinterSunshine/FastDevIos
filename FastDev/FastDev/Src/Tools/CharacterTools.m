//
//  CharacterTools.m
//  Studio
//
//  Created by edison on 16-3-24.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import "CharacterTools.h"

@implementation CharacterTools

+(NSString *) urlEncode:(NSString *) input
{
    NSString * outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes( NULL, /* allocator */ (__bridge CFStringRef)input, NULL, /* charactersToLeaveUnescaped */ (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
     return outputStr;
//    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)_userField.text, NULL, NULL,  kCFStringEncodingUTF8 ));
//    NSLog(@"unicodeStr = %@",encodedString);
}

+(NSString *) encodeBase64:(NSString *)plainString
{
    NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}

+(BOOL)isTextViewString:(NSString *)keyword
{
    NSInteger number = [keyword length];
    for (NSInteger loopIndex = 0; loopIndex < number; loopIndex++) {
        unichar codePoint = [keyword characterAtIndex:loopIndex];
        Boolean isEmoji = !((codePoint == 0x0) || (codePoint == 0x9) || (codePoint == 0xA) || (codePoint == 0xD) || ((codePoint >= 0x20) && (codePoint <= 0xD7FF)) || ((codePoint >= 0xE000) && (codePoint <= 0xFFFD)) || ((codePoint >= 0x10000) && (codePoint <= 0x10FFFF)));
        if (isEmoji)
        {
            return NO;
        }
    }
    return YES;
}
+(BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3|4|5|7|8)\\d{9}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    if ([regextestmobile evaluateWithObject:mobileNum] == YES)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (BOOL)isAllNum:(NSString *)string
{
    unichar c;
    for (int i=0; i<string.length; i++) {
        c=[string characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}
//
//NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:0];
//
//NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncodin
@end;
