//
//  CustomViewController.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "CustomViewController.h"
#import "CustomNaviBarView.h"
#import "CustomNavigationController.h"
#import "GlobalDefine.h"
#import "StudioHeader.h"
@interface CustomViewController ()

@property (nonatomic, readonly) CustomNaviBarView *m_viewNaviBar;

@end

@implementation CustomViewController
@synthesize m_viewNaviBar = _viewNaviBar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.wantsFullScreenLayout = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:BACKGROCOLOR];
    _viewNaviBar = [[CustomNaviBarView alloc] initWithFrame:Rect(0.0f, 0.0f, [CustomNaviBarView barSize].width, [CustomNaviBarView barSize].height)];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    //添加右滑手势返回
    [self navigationCanDragBack:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [UtilityFunc cancelPerformRequestAndNotification:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MobClick beginLogPageView: NSStringFromClass([self class])];
    if (_viewNaviBar && !_viewNaviBar.hidden)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick beginLogPageView: NSStringFromClass([self class])];
}


#pragma mark -

- (void)setNavBarBg:(UIImage *)image
{
    if (_viewNaviBar) {
        [_viewNaviBar setNavBarBg:image];
    }
}

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar)
    {
        [self.view bringSubviewToFront:_viewNaviBar];
    }else{}
}

- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;
}

- (void)setNaviBarTitle:(NSString *)strTitle textColor:(UIColor *)color;
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setNaviBarTitle:strTitle textColor:color];
    }else{APP_ASSERT_STOP}
}
- (void)setNaviBarTextView:(UIView *)textView
{
    if (_viewNaviBar)
    {
        [_viewNaviBar showCoverViewOnTextView:textView];
    }else{APP_ASSERT_STOP}
}
- (void)setNaviBarTitleView:(UIView *)titleView
{
    if (_viewNaviBar)
    {
        [_viewNaviBar showCoverViewOnTitleView:titleView];
    }else{APP_ASSERT_STOP}
}
- (void)setNaviBarRightView:(UIView *)rightView
{
    if (_viewNaviBar)
    {
        [_viewNaviBar showCoverViewOnRightView:rightView];
    }else{APP_ASSERT_STOP}
}
- (void)setNaviBarLeftBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftBtn:btn];
    }else{APP_ASSERT_STOP}
}
- (void)btnBack:(id)sender
{
    if (_viewNaviBar)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }else{APP_ASSERT_STOP}

}
- (void)setNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:btn];
    }else{APP_ASSERT_STOP}
}
- (void)setNaviBarRightSecondBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightSecondBtn:btn];
    }else{APP_ASSERT_STOP}
}
-(void)addlabelbadge:(NSString *)badge
{
    [_viewNaviBar setNumerLabelBadge:badge];
}

- (void)setTextNaviBarRightBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTextTightBtn:btn];
    }else{APP_ASSERT_STOP}
}

- (void)setRightTextNaviBarBtn:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightTextBtn:btn];
    }
    else{APP_ASSERT_STOP}
}

- (void)naviBarAddCoverView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }else{}
}

- (void)naviBarAddCoverViewOnTitleView:(UIView *)view
{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }else{}
}

- (void)naviBarRemoveCoverView:(UIView *)view
{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }else{}
}

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack
{
    if (self.navigationController)
    {
        [((CustomNavigationController *)(self.navigationController)) navigationCanDragBack:bCanDragBack];
    }else{}
}



@end
