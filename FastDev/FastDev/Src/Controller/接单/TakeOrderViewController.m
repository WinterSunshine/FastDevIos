//
//  TakeOrderViewController.m
//  FastDev
//
//  Created by edison on 16-7-27.
//  Copyright (c) 2016年 fast. All rights reserved.
//

#import "TakeOrderViewController.h"
#import "StudioHeader.h"

@interface TakeOrderViewController ()<UITableViewDataSource,UITableViewDelegate,MJRefreshBaseViewDelegate>

@property(strong,nonatomic) XTableView *xtableView;
@property(strong,nonatomic) NSMutableArray *dataSource;
@property(assign,nonatomic) NSInteger pageNum;
@property(strong,nonatomic) NSString *tradeTypeId;
@property(strong,nonatomic) NSString *beginTime;
@property(strong,nonatomic) NSString *endTime;
@end

@implementation TakeOrderViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        self.dataSource = [[NSMutableArray alloc] init];
        self.tradeTypeId = @"";
        self.beginTime = @"";
        self.endTime = @"";
        self.pageNum = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    [self setNaviBarLeftBtn:nil];
    [self setNaviBarTitle:@"列表" textColor:[UIColor whiteColor]];
    self.xtableView = [[XTableView alloc] initWithFrame:CGRectMake(0, 20, MAINSCREEN.size.width, MAINSCREEN.size.height) style:UITableViewStyleGrouped];
    [self.xtableView tableViewDelegate:self dataSourceDelegate:self dataSource:self.dataSource];
    [self.xtableView setPull:true setLoad:true delegate:self];
    [self.view addSubview:self.xtableView];
}

-(void) restoreVariable
{
    self.pageNum = 1;
    self.tradeTypeId = @"";
    self.beginTime = @"";
    self.endTime = @"";
}

-(void) asyncRetrive
{
    NSDictionary *paramDict = [NSDictionary dictionaryWithObjectsAndKeys:IOSAPPID,@"appId",[SessionTools getSession],@"session",self.tradeTypeId,@"tradeTypeId",self.beginTime,@"beginTime",self.endTime,@"endTime",[NSString stringWithFormat:@"%ld",(long)self.pageNum],@"pageIndex", nil];
    [HTTPTools getAllTakeOrderListOrCondition:(NSDictionary *) paramDict success:^(TakeOrderListBean *takeOrders)
    {
        if(self.pageNum == 1)
        {
            [self.xtableView pullRefresh:takeOrders.takeOrders];
        }else
        {
            [self.xtableView pullLoad:takeOrders.takeOrders];
        }
    } failure:^(NSString *error)
    {
        [RuleTools checkNoFirstData:self.xtableView errorMsg:error];
        [RuleTools checkNoMoreData:self errorMsg:error];
    }];
}


-(void) refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (self.xtableView.header == refreshView)
    {
        //下拉刷新数据请求
        [self performSelector:@selector(pullRefresh) withObject:nil afterDelay:1];
    } else {
        //上拉刷新数据请求
        [self performSelector:@selector(pullLoad) withObject:nil afterDelay:1];
    }
}

- (void)pullRefresh
{
    [self restoreVariable];
    [self reloadDeals];
}

- (void)pullLoad
{
    self.pageNum++;
    [self reloadDeals];
}

- (void)reloadDeals
{
    [self asyncRetrive];
    [self.xtableView.header endRefreshing];
    [self.xtableView.footer endRefreshing];
}

//设置分组个数
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//设置列表行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}

//cell初始化复用
-(UITableView *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MyFundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFundCell"];
//    if(cell == nil)
//    {
//        cell =  [[[NSBundle mainBundle] loadNibNamed:@"MyFundTableViewCell" owner:nil options:nil] firstObject];
//    }
//    MyFundBean *data = self.dataSource[indexPath.row];
//    [cell setCellValue:data];
    return nil;
}

//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


//设置点击事件回调
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.xtableView deselectRowAtIndexPath:indexPath animated:YES];
//    MyFundsDetailViewController *myFundsDetailViewController = [[MyFundsDetailViewController alloc] init];
//    MyFundBean *fundData = self.dataSource[indexPath.row];
//    myFundsDetailViewController.fundId = fundData.fundId;
//    [self.navigationController pushViewController:myFundsDetailViewController animated:TRUE];
}

//解决分割线左边不到顶端的问题
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

//销毁
-(void) dealloc
{
    [self.xtableView destory];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
