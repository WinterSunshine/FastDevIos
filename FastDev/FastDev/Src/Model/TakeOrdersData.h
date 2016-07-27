//
//  takeOrdersData.h
//  GameLeveling
//
//  Created by juefeng on 16/7/5.
//  Copyright © 2016年 juefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TakeOrdersData : NSObject
@property(nonatomic,strong) NSString *takeOrderId;
@property(nonatomic,strong) NSString *logoUrl;
@property(nonatomic,strong) NSString *takeOrderTitle;
@property(nonatomic,strong) NSString *gameInfo;
@property(nonatomic,strong) NSString *moneyInfo;
@end
