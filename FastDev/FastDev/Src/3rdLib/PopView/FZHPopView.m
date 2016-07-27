//
//  FZHPopView.m
//  test
//
//  Created by 冯志浩 on 16/5/27.
//  Copyright © 2016年 FZH. All rights reserved.
//

#import "FZHPopView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FZHPopView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end
@implementation FZHPopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        //初始化各种起始属性
        [self initAttribute];
        
        [self initTabelView];
    }
    return self;
}

- (void)initTabelView{
 
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.contentShift) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.contentView addSubview:self.tableView];
}

/**
 *  初始化起始属性
 */
- (void)initAttribute{
    
    self.buttonH = SCREEN_HEIGHT * (40.0/736.0);
    self.buttonMargin = 10;
    self.contentShift = SCREEN_HEIGHT * 0.5;
    self.animationTime = 0.2;
    self.backgroundColor = [UIColor colorWithWhite:0.614 alpha:0.700];
    
    [self initSubViews];
}
/**
 *  初始化子控件
 */
- (void)initSubViews{
    
    self.contentView = [[UIView alloc]init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.contentShift);
    [self addSubview:self.contentView];
}
/**
 *  展示pop视图
 *
 *  @param array 需要显示button的title数组
 */
- (void)showThePopViewWithArray:(NSMutableArray *)array{
//    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
//    
//    [window addSubview:self];
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    self.dataSource = array;
    //1.执行动画
    [UIView animateWithDuration:self.animationTime animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        self.contentView.transform = CGAffineTransformMakeTranslation(0, -self.contentShift);
    }];
    
}

- (void)dismissThePopView{
    
    [UIView animateWithDuration:self.animationTime animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        self.contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
[self dismissThePopView];
}
//- (void)touchesBegan:(NSSet<UITouch> *)touches withEvent:(UIEvent *)event
//{
//    [self dismissThePopView];
//}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"cellID";
    UIButton * button = nil;
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.buttonH);
        NSString * buttonStr = self.dataSource[indexPath.row];
        button.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        [button setTitle:buttonStr forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1000 + indexPath.row;
        UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.buttonH, SCREEN_WIDTH, 0.5)];
        lineView.backgroundColor = [UIColor colorWithWhite:0.844 alpha:1.000];
        [cell addSubview:lineView];
        [cell addSubview:button];
    }else
    {
         button = [cell subviews][2];
    }
    NSString * buttonStr = self.dataSource[indexPath.row];
    [button setTitle:buttonStr forState:UIControlStateNormal];
    return cell;
}
#pragma mark - UITableViewDelagate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)buttonClick:(UIButton *)button{
    
    if ([self.fzhPopViewDelegate respondsToSelector:@selector(getTheButtonTitleWithButton:)]) {
        [self.fzhPopViewDelegate getTheButtonTitleWithButton:button];
    }
}
@end
