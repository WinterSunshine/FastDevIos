//
//  DeviceTools.h
//  Studio
//
//  Created by edison on 16-3-21.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceTools : NSObject

+(NSString *) getIDFA;
+(NSString *) getDeviceOS;
+(NSString *) getIPAddress;

@end
