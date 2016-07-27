//
//  CustomNaviBarView.m
//  CustomNavigationBarDemo
//
//  Created by jimple on 14-1-6.
//  Copyright (c) 2014年 Jimple Chen. All rights reserved.
//

#import "CustomNaviBarView.h"
#import "GlobalDefine.h"
#import "StudioHeader.h"
#define FLOAT_TitleSizeNormal               19.0f
#define FLOAT_TitleSizeMini                 17.0f
#define RGB_TitleNormal                     RGB(80.0f, 80.0f, 80.0f)
#define RGB_TitleMini                       [UIColor blackColor]

@interface CustomNaviBarView ()

@property (nonatomic, readonly) UIButton *m_btnBack;
@property (nonatomic, readonly) UILabel *m_labelTitle;
@property (nonatomic, readonly) UIImageView *m_imgViewBg;
@property (nonatomic, readonly) UIButton *m_btnLeft;
@property (nonatomic, readonly) UIButton *m_btnRight;
@property (nonatomic, readonly) UIButton *m_btnRightSecond;
@property (nonatomic, readonly) BOOL m_bIsBlur;


@end

@implementation CustomNaviBarView

@synthesize m_btnBack = _btnBack;
@synthesize m_labelTitle = _labelTitle;
@synthesize m_imgViewBg = _imgViewBg;
@synthesize m_btnLeft = _btnLeft;
@synthesize m_btnRight = _btnRight;
@synthesize m_btnRightSecond = _btnRightSecond;
@synthesize m_bIsBlur = _bIsBlur;

+ (CGRect)rightBtnFrame
{
    return Rect(MAINRECT.size.width - 45, 25, 40, 40);
}
+ (CGRect)rightSecondBtnFrame
{
    return Rect(MAINRECT.size.width - 110, 25, 55, 35);
}
+ (CGSize)barBtnSize
{
    return Size(Width, Height);
}

+ (CGSize)barSize
{
    return Size(MAINSCREEN.size.width, 64.0f);
}

+ (CGRect)titleViewFrame
{
    return Rect(MAINSCREEN.size.width / 4, 27.0f, MAINSCREEN.size.width / 2, 35.0f);
}

// 创建一个导航条按钮：使用默认的按钮图片。
+ (UIButton *)createNormalNaviBarBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    UIButton *btn = [[self class] createImgNaviBarBtnByImgNormal:@"NaviBtn_Normal" imgHighlight:@"NaviBtn_Normal_H" target:target action:action];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:RGB_TextDark forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [UtilityFunc label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    
    return btn;
}

// 创建一个导航条按钮：自定义按钮图片。
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action
{
    return [[self class] createImgNaviBarBtnByImgNormal:strImg imgHighlight:strImgHighlight imgSelected:strImg target:target action:action];
}
+ (UIButton *)createImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    
    CGFloat fDeltaWidth = ([[self class] barBtnSize].width - imgNormal.size.width)/2.0f;
    CGFloat fDeltaHeight = ([[self class] barBtnSize].height - imgNormal.size.height)/2.0f;
    fDeltaWidth = (fDeltaWidth >= 2.0f) ? fDeltaWidth/2.0f : 0.0f;
    fDeltaHeight = (fDeltaHeight >= 2.0f) ? fDeltaHeight/2.0f : 0.0f;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, fDeltaWidth, fDeltaHeight, fDeltaWidth)];
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, -imgNormal.size.width, fDeltaHeight, fDeltaWidth)];
    
    return btn;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        _bIsBlur = (IsiOS7Later && Is4Inch);
        
        [self initUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initUI];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void)initUI
{
    self.backgroundColor = GREENCOLOR;
    
    // 默认左侧显示返回按钮
    /*
    _btnBack = [[self class] createImgNaviBarBtnByImgNormal:nil imgHighlight:nil target:self action:@selector(btnBack:)];
    */
    _btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnBack setFrame:CGRectMake(0, 0, 50, 35)];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setImage:[UIImage imageNamed:@"btn_back@2x"]];
    [imageView setFrame:CGRectMake(17, 8, 13, 22)];
    [_btnBack addSubview:imageView];
    [_btnBack addTarget:self action:@selector(btnBack:) forControlEvents:UIControlEventTouchUpInside];
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _labelTitle.backgroundColor = [UIColor clearColor];
    _labelTitle.textColor = RGB_TitleNormal;
    _labelTitle.font = [UIFont systemFontOfSize:FLOAT_TitleSizeNormal];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    
    _imgViewBg = [[UIImageView alloc] initWithFrame:self.bounds];
    _imgViewBg.alpha = 1.0f;
    
//    if (DEVICE_IS_IPHONE4 || DEVICE_IS_IPHONE5) {
//        [_imgViewBg setImage:[Tools imagesNamedFromCustomBundle:@"title@2x" bundleName:TABBAR_BUNDLE]];
//    }
//    if (DEVICE_IS_IPHONE6) {
//        [_imgViewBg setImage:[Tools imagesNamedFromCustomBundle:@"title@2x_6" bundleName:TABBAR_BUNDLE]];
//    }
//    if (DEVICE_IS_IPHONE6_Plus) {
//        [_imgViewBg setImage:[Tools imagesNamedFromCustomBundle:@"title@2x_6p" bundleName:TABBAR_BUNDLE]];
//    }
    
    /*
    if (_bIsBlur)
    {// iOS7可设置是否需要现实磨砂玻璃效果
        _imgViewBg.alpha = 0.50f;
        UINavigationBar *naviBar = [[UINavigationBar alloc] initWithFrame:self.bounds];
        [self addSubview:naviBar];
    }else{}
    */
    _labelTitle.frame = [[self class] titleViewFrame];
    _imgViewBg.frame = self.bounds;
    
    [self addSubview:_imgViewBg];
    [self addSubview:_labelTitle];
    
    [self setBackLeftBtn:_btnBack];
}

- (void)setNavBarBg:(UIImage *)image
{
    [_imgViewBg setImage:image];
}

- (void)setNaviBarTitle:(NSString *)strTitle textColor:(UIColor *)color
{
    [_labelTitle setText:strTitle];
    [_labelTitle setTextColor:color];
}

- (void)setLeftBtn:(UIButton *)btn
{
    if (_btnLeft)
    {
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }else{}
    
    _btnLeft = btn;
    if (_btnLeft)
    {
        _btnLeft.frame = Rect(MAINRECT.origin.x, 25, 60, 35);
        [self addSubview:_btnLeft];
    }else{}
}

- (void)setBackLeftBtn:(UIButton *)btn
{
    if (_btnLeft)
    {
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }else{}
    
    _btnLeft = btn;
    if (_btnLeft)
    {
        _btnLeft.frame = Rect(MAINRECT.origin.x, BarButY, 80, 50);
        [self addSubview:_btnLeft];
    }else{}
}

- (void)setRightBtn:(UIButton *)btn
{
    if (_btnRight)
    {
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }else{}
    
    _btnRight = btn;
    if (_btnRight)
    {
        _btnRight.frame = [[self class] rightBtnFrame];
//        _btnRight.backgroundColor = [UIColor redColor];
        [self addSubview:_btnRight];
        
    }else{}
}
- (void)setRightSecondBtn:(UIButton *)btn
{
    if (_btnRightSecond)
    {
        [_btnRightSecond removeFromSuperview];
        _btnRightSecond = nil;
    }else{}
    
    _btnRightSecond = btn;
    if (_btnRightSecond)
    {
        _btnRightSecond.frame = [[self class] rightSecondBtnFrame];
        [self addSubview:_btnRightSecond];
        
    }else{}
}
-(void)setNumerLabelBadge:(NSString *)badge
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
    label.backgroundColor = [UIColor redColor];
    label.text = badge;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = FONTSHI;
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = 9;
    label.layer.masksToBounds = YES;
    [_btnRight addSubview:label];
}

- (void)setTextTightBtn:(UIButton *)btn
{
    if (_btnRight)
    {
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }else{}
    
    _btnRight = btn;
    if (_btnRight)
    {
        _btnRight.frame = CGRectMake(MAINRECT.size.width - 40, BarButY, 35, 25);
        [self addSubview:_btnRight];
        
        
    }else{}
}

- (void)setRightTextBtn:(UIButton *)btn
{
    if (_btnRight)
    {
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }else{}
    
    _btnRight = btn;
    if (_btnRight)
    {
        _btnRight.frame = CGRectMake(MAINRECT.size.width - 60, BarButY - 4, 35, 25);
        [self addSubview:_btnRight];
    }else{}
}

- (void)btnBack:(id)sender
{
    if (self.m_viewCtrlParent)
    {
        [self.m_viewCtrlParent btnBack:sender];
    }else{APP_ASSERT_STOP}
}

- (void)showCoverView:(UIView *)view
{
    [self showCoverView:view animation:NO];
}
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation
{
    if (view)
    {
        [self hideOriginalBarItem:YES];
        
        [view removeFromSuperview];
        
        view.alpha = 0.4f;
        [self addSubview:view];
        if (bIsAnimation)
        {
            [UIView animateWithDuration:0.2f animations:^()
             {
                 view.alpha = 1.0f;
             }completion:^(BOOL f){}];
        }
        else
        {
            view.alpha = 1.0f;
        }
    }else{APP_ASSERT_STOP}
}
- (void)showCoverViewOnTextView:(UIView *)view
{
    if (view)
    {
        if (_labelTitle)
        {
            _labelTitle.hidden = YES;
        }else{}
        
        [view removeFromSuperview];
        view.frame = Rect((MAINSCREEN.size.width-70)/2, 25.0f, 70, 30.0f);
        [self addSubview:view];
    }else{APP_ASSERT_STOP}
}
- (void)showCoverViewOnTitleView:(UIView *)view
{
    if (view)
    {
        if (_labelTitle)
        {
            _labelTitle.hidden = YES;
        }else{}
        
        [view removeFromSuperview];
        view.frame = Rect(MAINSCREEN.size.width / 4 - 10, 30.0f, MAINSCREEN.size.width / 2 + 20, 44.0f);
        [self addSubview:view];
    }else{APP_ASSERT_STOP}
}
- (void)showCoverViewOnRightView:(UIView *)view
{
    if (view)
    {
        [view removeFromSuperview];
        view.frame = Rect(MAINSCREEN.size.width - 100, 22.0f, 80, 35.0f);
        
        [self addSubview:view];
    }else{APP_ASSERT_STOP}
}
- (void)hideCoverView:(UIView *)view
{
    [self hideOriginalBarItem:NO];
    if (view && (view.superview == self))
    {
        [view removeFromSuperview];
    }else{}
}

#pragma mark -
- (void)hideOriginalBarItem:(BOOL)bIsHide
{
    if (_btnLeft)
    {
        _btnLeft.hidden = bIsHide;
    }else{}
    if (_btnBack)
    {
        _btnBack.hidden = bIsHide;
    }else{}
    if (_btnRight)
    {
        _btnRight.hidden = bIsHide;
    }else{}
    if (_btnRightSecond)
    {
        _btnRightSecond.hidden = bIsHide;
    }else{}
    if (_labelTitle)
    {
        _labelTitle.hidden = bIsHide;
    }else{}
}
@end
