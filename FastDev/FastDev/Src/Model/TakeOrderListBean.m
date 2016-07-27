//
//  TakeOrderListBean.m
//  GameLeveling
//
//  Created by juefeng on 16/7/6.
//  Copyright © 2016年 juefeng. All rights reserved.
//

#import "TakeOrderListBean.h"
#import "TakeOrdersData.h"
@implementation TakeOrderListBean
- (NSDictionary *) objectClassInArray
{
    return @{@"takeOrders":[TakeOrdersData class]};
}
@end
