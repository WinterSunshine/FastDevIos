//
//  getUserInfoBean.h
//  GameLeveling
//
//  Created by juefeng on 16/7/8.
//  Copyright © 2016年 juefeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserBean : NSObject
@property(nonatomic,strong) NSString *userAccount;
@property(nonatomic,strong) NSString *userBalance;
@property(nonatomic,strong) NSString *userPhone;
@property(nonatomic,strong) NSString *mobile;
@property(nonatomic,strong) NSString *qq;
@property(nonatomic,strong) NSString *userRealName;
@property(nonatomic,strong) NSString *userCard;
@property(nonatomic,strong) NSString *payPasswordFlag;
@property(nonatomic,strong) NSString *realFlag;
@property(nonatomic,strong) NSString *userPhoneYzFlag;
@property(nonatomic,strong) NSString *accountSetFlag;
@property(nonatomic,strong) NSString *lockAccountState;
@end
