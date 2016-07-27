//
//  SessionTools.h
//  Studio
//
//  Created by edison on 16-3-21.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SessionTools : NSUserDefaults

+(NSString *) getSession;
+(void) putSession:(NSString *)session;
+(void) clearSession;

+(NSString *) getstudioName;
+(void) putstudioName:(NSString *)studioName;

+(NSString *) getdeviceNo;
+(void) putdeviceNo:(NSString *)deviceNo;

+(NSString *) getuserAccount;
+(void) putuserAccount:(NSString *)userAccount;
+(NSString *) getFirstLoading;
+(void) putFirstLoading:(BOOL)FirstLoading;

@end
