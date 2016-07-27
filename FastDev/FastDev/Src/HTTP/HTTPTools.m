//
//  HTTPTools.m
//  BarCodeQuery
//
//  Created by edison on 15-11-27.
//  Copyright (c) 2015年 edison. All rights reserved.
//

#import "HTTPTools.h"

@implementation HTTPTools

//获取接单大厅列表
+(void)getAllTakeOrderListOrCondition:(NSDictionary *)param success:(void (^)(TakeOrderListBean *takeOrders))success failure:(void (^)(NSString *error))failure
{
    NSString *postParams = [self buildPostParams:param];
    [self post:GET_ALL_TAKE_ORDER_LIST_OR_CONDITION params:postParams resultClass:[TakeOrderListBean class] success:success failure:failure];
}

//获取用户基本信息
+(void)getUserInfo:(NSDictionary *)param success:(void (^)(UserBean *userInfo))success failure:(void (^)(NSString *error))failure
{
    NSString *postParams = [self buildPostParams:param];
    [self post:GET_USER_INFO params:postParams resultClass:[UserBean class] success:success failure:failure];
}

+(NSString *)buildPostParams:(NSDictionary *)paramDict
{
    //Key按字典排序
    NSString *paramStr = [self sortByKey:paramDict];
    //MD5加密Sign
    NSString *covertEndSign = [self get32MD5Sign:paramStr];
    //拼接原始字段和Sign字段
    return [NSString stringWithFormat:@"%@sign=%@",paramStr,covertEndSign];
}

+(NSString *)sortByKey:(NSDictionary *)paramDict
{
    NSArray* sortKey = [paramDict allKeys];
    sortKey = [sortKey sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result == NSOrderedDescending;
    }];
    NSString *paramStr = [[NSString alloc] init];
    for (NSString *key in sortKey)
    {
        NSString *value = paramDict[key];
        if(![value isEqualToString:@""])
        {
            NSString *joinStr = [NSString stringWithFormat:@"%@=%@&",key,value];
            paramStr = [paramStr stringByAppendingString:joinStr];
        }
    }
    return paramStr;
}

+(NSString *)get32MD5Sign:(NSString *)covertBeginSign
{
    covertBeginSign = [covertBeginSign substringToIndex:covertBeginSign.length - 1];
    covertBeginSign = [covertBeginSign stringByAppendingString:SALT];
    const char *cStr=   [covertBeginSign UTF8String ];
    unsigned char digest[ CC_MD5_DIGEST_LENGTH ];
    CC_MD5 ( cStr, (CC_LONG)strlen (cStr), digest );
    NSMutableString *result = [ NSMutableString stringWithCapacity : CC_MD5_DIGEST_LENGTH * 2 ];
    for ( int i = 0 ; i < CC_MD5_DIGEST_LENGTH ; i++)
        [result appendFormat : @"%02x" , digest[i]];
    return result;
}
+(void) post:(NSString *)method params:(NSString *)params resultClass:(Class)resultCls success:(void (^)(id responseObject))success failure:(void (^)(NSString *))failure
{
    NSLog(@"an request post is method:%@  params:%@",method,params);
    [MQRequest request:method post:params completeBlock:^(NSData *data) {
        //请求成功
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSString *opcode = [dic objectForKey:@"opcode"];
        NSString *reason = [dic objectForKey:@"reason"];
        if([opcode isEqual:@"0"])
        {
            //opcode成功
            NSDictionary *resultDic = [dic objectForKey:@"result"];
            id result = [resultCls objectWithKeyValues:resultDic];
            success(result);
        }else
        {
            //opcode失败
            NSString * error = [NSString stringWithFormat:@"%@:%@",opcode,reason];
            NSLog(@"opcode = %@",error);
            failure(error);
        }
    } errorBlock:^(NSError *error) {
        //请求失败
        [MBProgressHUD showError:[error localizedDescription]];
    }];
}
@end
