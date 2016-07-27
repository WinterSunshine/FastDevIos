//
//  XFSegmentView.h
//  newtest
//
//  Copyright © 2016年 BigFly. All rights reserved.
//
#define RGBA(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define ImageName(name) [UIImage imageNamed:name]
#define Font(x) [UIFont systemFontOfSize:x]
#define Frame(x,y,w,h) CGRectMake(x, y, w, h)
#define Size(w,h) CGSizeMake(w, h)
#define Point(x,y) CGPointMake(x, y)
#define ZeroRect CGRectZero
#define TouchUpInside UIControlEventTouchUpInside
#define NormalState UIControlStateNormal
#define SelectedState UIControlStateSelected
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define WH(x) (x)*SCREEN_WIDTH/375.0
#define MAINGREENCOLOR RGBA(46,170,97)
#define BlackFontColor RGBA(34,34,34)
#define WhiteColor RGBA(255,255,255)
#define ContentBackGroundColor RGBA(238,238,238)
#import <UIKit/UIKit.h>


@class XFSegmentView;
@protocol XFSegmentViewDelegate <NSObject>
-(void)segmentView:(XFSegmentView *)segmentView didSelectIndex:(NSInteger)index;
@end
@interface XFSegmentView : UIView
@property (nonatomic) id <XFSegmentViewDelegate>delegate;
@property (nonatomic) NSArray * titles;
@property (nonatomic) UIColor * titleColor;//标题字体颜色
@property (nonatomic) UIColor * selectColor;//标题字体选中颜色
@property (nonatomic) UIColor * titleBackgroundColor;//标题背景颜色
@property (nonatomic) int selectIndex;
@property (nonatomic) UIFont * titleFont;
@property (nonatomic) UIView * dotView;
@end





@interface UIView (Category)
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat w;
@property (nonatomic,assign) CGFloat h;
@end
