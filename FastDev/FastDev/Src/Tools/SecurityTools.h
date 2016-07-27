//
//  SecurityTools.h
//  GameLeveling
//
//  Created by edison on 16-7-12.
//  Copyright (c) 2016年 juefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecurityTools : NSObject

//Base64加密
+(NSString *) encodeBase64:(NSString *)plainString;
//MD5加密
+(NSString *) encodeMD5:(NSString *)plainString;
@end
