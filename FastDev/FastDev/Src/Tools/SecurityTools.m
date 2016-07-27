//
//  SecurityTools.m
//  GameLeveling
//
//  Created by edison on 16-7-12.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import "SecurityTools.h"
#import "StudioHeader.h"

@implementation SecurityTools

+(NSString *) encodeBase64:(NSString *)plainString
{
    NSData *plainData = [plainString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    return base64String;
}

+(NSString *) encodeMD5:(NSString *)plainString
{
    const char *cStr = [plainString UTF8String];
    unsigned char digest[ CC_MD5_DIGEST_LENGTH ];
    CC_MD5 ( cStr, (CC_LONG)strlen (cStr), digest );
    NSMutableString *result = [ NSMutableString stringWithCapacity : CC_MD5_DIGEST_LENGTH * 2 ];
    for ( int i = 0 ; i < CC_MD5_DIGEST_LENGTH ; i++)
        [result appendFormat : @"%02x" , digest[i]];
    return result;
}

@end
