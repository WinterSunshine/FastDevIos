//
//  CustomNaviBarView.h
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomViewController.h"

@interface CustomNaviBarView : UIView

@property (nonatomic, weak) CustomViewController *m_viewCtrlParent;
@property (nonatomic, readonly) BOOL m_bIsCurrStateMiniMode;


+ (CGRect)rightBtnFrame;
+ (CGRect)rightSecondBtnFrame;
+ (CGSize)barBtnSize;
+ (CGSize)barSize;
+ (CGRect)titleViewFrame;

// 创建一个导航条按钮：使用默认的按钮图片。
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;

// 创建一个导航条按钮：自定义按钮图片。
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action;

// 用自定义的按钮和标题替换默认内容
- (void)setLeftBtn:(UIButton *)btn;
- (void)setRightBtn:(UIButton *)btn;
- (void)setRightSecondBtn:(UIButton *)btn;
- (void)setNumerLabelBadge:(NSString *)badge;
- (void)setNaviBarTitle:(NSString *)strTitle textColor:(UIColor *)color;
- (void)setTextTightBtn:(UIButton *)btn;
- (void)setRightTextBtn:(UIButton *)btn;
- (void)setNavBarBg:(UIImage *)image;
- (void)btnBack:(id)sender;
// 在导航条上覆盖一层自定义视图。比如：输入搜索关键字时，覆盖一个输入框在上面。
- (void)showCoverView:(UIView *)view;
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation;
- (void)showCoverViewOnTitleView:(UIView *)view;
- (void)showCoverViewOnTextView:(UIView *)view;
- (void)showCoverViewOnRightView:(UIView *)view;
- (void)hideCoverView:(UIView *)view;



@end
