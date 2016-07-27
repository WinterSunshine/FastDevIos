//
//  HomeViewContorller.m
//  FastDev
//
//  Created by edison on 16-7-27.
//  Copyright (c) 2016年 fast. All rights reserved.
//

#import "HomeViewContorller.h"

@interface HomeViewContorller ()

@end

@implementation HomeViewContorller

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    [self setNaviBarLeftBtn:nil];
    [self setNaviBarTitle:@"首页" textColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
