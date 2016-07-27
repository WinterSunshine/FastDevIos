//
//  XTableView.m
//  Studio
//
//  Created by edison on 16-3-22.
//  Copyright (c) 2016年 张毅斐. All rights reserved.
//

#import "XTableView.h"
#import "StudioHeader.h"

@implementation XTableView

-(void) tableViewDelegate:(UIViewController<UITableViewDelegate> *)tableViewDelegate
       dataSourceDelegate:(UIViewController<UITableViewDataSource> *)dataSourceDelegate
               dataSource:(NSMutableArray *)dataSource;
{
    self.delegate = tableViewDelegate;
    self.dataSource = dataSourceDelegate;
    self.datas = dataSource;
    self.noDataView = [[UIView alloc] init];
    self.backgroundColor = BACKGROCOLOR;
    self.showsVerticalScrollIndicator = NO;
    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    if ([self respondsToSelector:@selector(setSeparatorInset:)])
    {
        [self setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)])
    {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(void) setPull:(BOOL)isPull setLoad:(BOOL)isLoad delegate:(UIViewController<MJRefreshBaseViewDelegate> *)delegate
{
    if(isPull)
    {
        self.header = [[MJRefreshHeaderView alloc] init];
        self.header.delegate = delegate;
        self.header.scrollView = self;
    }
    if(isLoad)
    {
        self.footer = [[MJRefreshFooterView alloc] init];
        self.footer.delegate = delegate;
        self.footer.scrollView = self;
    }
}

-(void) removePull:(BOOL)isPull removeLoad:(BOOL)isLoad
{
    if(isPull)
    {
        [self.header removeFromSuperview];
        self.header.scrollView = self;
    }
    if(isLoad)
    {
        [self.header removeFromSuperview];
        self.header.scrollView = self;
    }
    
}

-(void) pullRefresh:(NSMutableArray *)datas
{
    [self showDataView];
    [self.datas removeAllObjects];
    [self.datas addObjectsFromArray:datas];
    [self reloadData];
}

-(void) pullLoad:(NSMutableArray *)datas
{
    [self.datas addObjectsFromArray:datas];
    [self reloadData];
}

-(void) showDataView
{
    self.noDataView.hidden = YES;
}

-(void) showNoDataView:(NSString *)error
{
    [self.datas removeAllObjects];
    [self reloadData];
    
    self.noDataView.frame =  CGRectMake(0 , 0, self.frame.size.width, self.frame.size.height);
    self.noDataView.hidden = NO;
    self.noDataView.backgroundColor = BACKGROCOLOR;
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:CGRectMake((self.frame.size.width-(458/2))/2, 70, 458/2, 200)];
    [imageView setImage:[Tools imagesNamedFromCustomBundle:@"icon_order_no_data" bundleName:TABBAR_BUNDLE]];
    [self.noDataView  addSubview:imageView];
    
    UILabel *noDataLable = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.frame.origin.y+imageView.frame.size.height+20, self.frame.size.width, 20)];
    [noDataLable setText:error];
    noDataLable.textAlignment = NSTextAlignmentCenter;
    [noDataLable setTextColor:SHENHUICOLOR];
    [noDataLable setFont:FONTSHIQI];
    [self.noDataView  addSubview:noDataLable];
    
    [self setBackgroundView:self.noDataView];
}

-(void) destory
{
    [self.header free];
    [self.footer free];
}

@end
