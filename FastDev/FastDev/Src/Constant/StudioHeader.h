//
//  StudioHeader.h
//  Studio
//
//  Created by juefeng on 16/2/29.
//  Copyright © 2016年 张毅斐. All rights reserved.
//
//系统工具
#import "Tools.h"
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
//基础工具集和自定义控件
#import "MQRequest.h"
#import "Toast+UIView.h"
#import "UIImageView+WebCache.h"
#import "MobClick.h"
#import "MJRefresh.h"
#import "Reachability.h"
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "MJExtension.h"
#import "MBProgressHUD+NJ.h"
#import "ProgressHUD.h"
#import "HTTPTools.h"
#import "SessionTools.h"
#import "DeviceTools.h"
#import "XTableView.h"
#import "CharacterTools.h"
#import "SystemTools.h"
#import "RuleTools.h"
#import "TimeTools.h"
#import "SecurityTools.h"
#import "UMCheckUpdate.h"
#import "WHC_Banner.h"
#import "PAImageView.h"
#import "XFSegmentView.h"
#import "QRadioButton.h"
#import "OpenUDID.h"
//Controller
#import "RDVTabBarController.h"
#import "RDVTabBarItem.h"
#import "AppNavigationController.h"
#import "HomeViewContorller.h"
#import "TakeOrderViewController.h"
#import "UserViewController.h"
//Model
#import "OperationBean.h"
#import "UserBean.h"
#import "TakeOrderListBean.h"
#import "TakeOrdersData.h"

#ifndef StudioHeader_h
#define StudioHeader_h
#define MAINSCREEN    [UIScreen mainScreen].bounds
#define MENU_HEIGHT 40
#define MENU_BUTTON_WIDTH  [[UIScreen mainScreen] bounds].size.width / 3
#define IOSAPPID @"3yx032"
#define SALT @"3evgbh4nuQiaepq0j2mVB9p5NxsTscdY"
#define DeviceType @"20"
#define APPLE_ID   @"1021898910"  // （appid数字串）
/*----------------友盟----------------*/
#define YOUMENG_Key @"5769fbef67e5e86198003e7e"
#define YOUMENG_Channel  @"test"

//清理缓存路径
#define CACHESPATH [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]
// 状态栏(statusbar)
#define RECTSTATUS [[UIApplication sharedApplication] statusBarFrame]
// 导航栏（navigationbar）
#define RECTNAV self.navigationController.navigationBar.frame

/*---------------接口访问---------------*/
#define SERVER_PATH @"http://192.168.61.1:8080/qy/"     //ServerPath

/*---------------后台接口名称---------------*/
#define GET_ALL_TAKE_ORDER_LIST_OR_CONDITION  SERVER_PATH@"getAllTakeOrderListOrCondition" //获取列表
#define GET_USER_INFO   SERVER_PATH@"getUserInfo" //获取用户信息

/*---------------首页色值---------------*/
#define BACKGROCOLOR [UIColor colorWithRed:244.0 / 255.0 green:244.0 / 255.0 blue:244.0 / 255.0 alpha:1.0]
#define GREENCOLOR [UIColor colorWithRed:46.0 / 255.0 green:170.0 / 255.0 blue:97.0 / 255.0 alpha:1.0]
#define SHENREDCOLOR [UIColor colorWithRed:219.0 / 255.0 green:86.0 / 255.0 blue:77.0 / 255.0 alpha:1.0]
#define QIANREDCOLOR [UIColor colorWithRed:246.0 / 255.0 green:159.0 / 255.0 blue:131.0 / 255.0 alpha:1.0]
#define SHENHUICOLOR [UIColor colorWithRed:106.0 / 255.0 green:102.0 / 255.0 blue:97.0 / 255.0 alpha:1.0]
#define QIANHUICOLOR [UIColor colorWithRed:155.0 / 255.0 green:155.0 / 255.0 blue:155.0 / 255.0 alpha:1.0]
#define BUTTONCOLOR [UIColor colorWithRed:79.0 / 255.0 green:189.0 / 255.0 blue:165.0 / 255.0 alpha:1.0]


/*---------------字体大小---------------*/
#define FONTERWU    [UIFont systemFontOfSize:25.0]
#define FONTERSI    [UIFont systemFontOfSize:24.0]
#define FONTERSAN    [UIFont systemFontOfSize:23.0]
#define FONTERER    [UIFont systemFontOfSize:22.0]
#define FONTERYI    [UIFont systemFontOfSize:21.0]
#define FONTERSHI    [UIFont systemFontOfSize:20.0]
#define FONTSHIJIU  [UIFont systemFontOfSize:19.0]
#define FONTSHIBA  [UIFont systemFontOfSize:18.0]
#define FONTSHIQI   [UIFont systemFontOfSize:17.0]
#define FONTSHILIU  [UIFont systemFontOfSize:16.0]
#define FONTSHIWU   [UIFont systemFontOfSize:15.0]
#define FONTSHISI   [UIFont systemFontOfSize:14.0]
#define FONTSHISAN  [UIFont systemFontOfSize:13.0]
#define FONTSHIER   [UIFont systemFontOfSize:12.0]
#define FONTSHIYI   [UIFont systemFontOfSize:11.0]
#define FONTSHI     [UIFont systemFontOfSize:10.0]
#define FONTJIU     [UIFont systemFontOfSize:9.0]

/*---------------BUNDLE---------------*/
#define TABBAR_BUNDLE @"TabBar.bundle"

/*---------------系统型号---------------*/
#define DEVICE_IS_IPHONE6_Plus ([[UIScreen mainScreen] bounds].size.height == 736)
#define DEVICE_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define DEVICE_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define DEVICE_IOS8 [[UIDevice currentDevice].systemVersion floatValue] >= 8.0
#define DEVICE_IOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7.0
#define DEVICE_IOS6 [[UIDevice currentDevice].systemVersion floatValue] < 7.0

#endif /* StudioHeader_h */
