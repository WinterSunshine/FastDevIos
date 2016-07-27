//
//  HTTPTools.h
//  BarCodeQuery
//
//  Created by edison on 15-11-27.
//  Copyright (c) 2015年 edison. All rights reserved.
//

#import "StudioHeader.h"
#import "TakeOrderListBean.h"
#import "UserBean.h"

@interface HTTPTools : NSObject
//获取接单大厅列表
+(void)getAllTakeOrderListOrCondition:(NSDictionary *)param success:(void (^)(TakeOrderListBean *takeOrders))success failure:(void (^)(NSString *error))failure;

//获取用户基本信息
+(void)getUserInfo:(NSDictionary *)param success:(void (^)(UserBean *userInfo))success failure:(void (^)(NSString *error))failure;
@end
