//
//  CustomViewController.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewController : UIViewController

- (void)bringNaviBarToTopmost;

- (void)hideNaviBar:(BOOL)bIsHide;
- (void)setNaviBarTitle:(NSString *)strTitle textColor:(UIColor *)color;
- (void)setNaviBarTitleView:(UIView *)titleView;
- (void)setNaviBarTextView:(UIView *)textView;
- (void)setNaviBarRightView:(UIView *)rightView;
- (void)setNaviBarLeftBtn:(UIButton *)btn;
- (void)setNaviBarRightBtn:(UIButton *)btn;
- (void)setNaviBarRightSecondBtn:(UIButton *)btn;
- (void)setTextNaviBarRightBtn:(UIButton *)btn;
- (void)setRightTextNaviBarBtn:(UIButton *)btn;
- (void)addlabelbadge:(NSString *)badge;
- (void)btnBack:(id)sender;
- (void)naviBarAddCoverView:(UIView *)view;
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
- (void)naviBarRemoveCoverView:(UIView *)view;

- (void)setNavBarBg:(UIImage *)image;

// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)bCanDragBack;


@end
