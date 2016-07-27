//
//  UserViewController.m
//  FastDev
//
//  Created by edison on 16-7-27.
//  Copyright (c) 2016年 fast. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    [self setNaviBarLeftBtn:nil];
    [self setNaviBarTitle:@"我的" textColor:[UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
