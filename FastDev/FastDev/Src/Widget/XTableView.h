//
//  XTableView.h
//  Studio
//
//  Created by edison on 16-3-22.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudioHeader.h"

@interface XTableView : UITableView
@property(strong,nonatomic) MJRefreshHeaderView *header;
@property(strong,nonatomic) MJRefreshFooterView *footer;
@property(strong,nonatomic) NSMutableArray *datas;
@property(strong,nonatomic) UIView *noDataView;

//代理-新
-(void) tableViewDelegate:(UIViewController<UITableViewDelegate> *)tableViewDelegate
       dataSourceDelegate:(UIViewController<UITableViewDataSource> *)dataSourceDelegate
               dataSource:(NSMutableArray *)dataSource;

//开关 刷新代理
-(void) setPull:(BOOL)isPull
        setLoad:(BOOL)isLoad
       delegate:(UIViewController<MJRefreshBaseViewDelegate> *)delegate;

//下拉刷新
-(void) pullRefresh:(NSMutableArray *)datas;

//开关 移除刷新和加载
-(void) removePull:(BOOL)isPull removeLoad:(BOOL)isLoad;

//上拉加载
-(void) pullLoad:(NSMutableArray *)datas;

//显示有数据界面
-(void) showDataView;

//显示无数据界面
-(void) showNoDataView:(NSString *)error;

//释放
-(void) destory;
@end
