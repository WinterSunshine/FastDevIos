//
//  XFSegmentView.m
//  newtest
//
//  Copyright © 2016年 BigFly. All rights reserved.
//
#define BTag 10000
#import "XFSegmentView.h"
@interface XFSegmentView (){
    NSMutableArray *buttons;
    float wid;
}
@end

@implementation XFSegmentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self ininViewData];
        [self initViews];
    }
    return self;
}


- (void)ininViewData{
    _titles = @[@"title1",@"title2",@"title3",@"title4"];
    _titleColor = BlackFontColor;
    _selectColor = MAINGREENCOLOR;
    _titleBackgroundColor = WhiteColor;
    _titleFont = Font(14);
}
- (void)initViews{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    buttons = [NSMutableArray array];
    wid = self.w/(float)_titles.count;
    for (int i = 0; i < _titles.count; i++) {
        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(i * wid, 0, wid, self.h - 2)];
        [btn setTitle:_titles[i] forState:NormalState];
        [btn.titleLabel setFont:_titleFont];
        [btn setTitleColor:_titleColor forState:NormalState];
        [btn setTitleColor:_selectColor forState:SelectedState];
        btn.titleLabel.font=_titleFont;
        btn.tag = BTag + i;
        [btn addTarget:self action:@selector(segmentIndexSelected:) forControlEvents:TouchUpInside];
        if (i == 0) {
            _dotView = [[UIView alloc]initWithFrame:Frame(0, self.h-2, wid, 2)];
            _dotView.backgroundColor = MAINGREENCOLOR;
            [self addSubview:_dotView];
            btn.selected = YES;
        }
        [self addSubview:btn];
        [buttons addObject:btn];
        btn.backgroundColor= _titleBackgroundColor;
    }
    self.backgroundColor=_titleBackgroundColor;
}
#pragma mark --button方法--
- (void)segmentIndexSelected:(UIButton *)button{
    self.selectIndex = (int)button.tag -BTag;
    for (UIButton *btn in buttons) {
        btn.selected = NO;
    }
    button.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        _dotView.frame=Frame(button.x, _dotView.y, _dotView.w, _dotView.h);
    }];
    if (self.delegate &&[self.delegate respondsToSelector:@selector(segmentView:didSelectIndex:)]) {
        [self.delegate segmentView:self didSelectIndex:self.selectIndex];
    }
}
#pragma mark --setter方法(默认值)--

-(void)setTitles:(NSArray *)titles{
    _titles = titles ? titles : @[@"1",@"2",@"3",@"4"];
    for (int i=0; i<_titles.count; i++) {
        UIButton *btn= buttons[i];
        [btn setTitle:_titles[i] forState:NormalState];
    }
}
//标题字体颜色
- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor ? titleColor : BlackFontColor;
    for (int i=0; i<_titles.count; i++) {
        UIButton *btn= buttons[i];
        [btn setTitleColor:_titleColor forState:NormalState];
    }
}
//标题字体选中颜色
- (void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor ? selectColor : MAINGREENCOLOR;
    for (int i=0; i<_titles.count; i++) {
        UIButton *btn= buttons[i];
        [btn setTitleColor:_selectColor forState:SelectedState];
    }
}
//标题背景颜色
- (void)setTitleBackgroundColor:(UIColor *)titleBackgroundColor{
    _titleBackgroundColor = titleBackgroundColor ? titleBackgroundColor : WhiteColor;
    self.backgroundColor= _titleBackgroundColor;
}
- (void)setSelectIndex:(int)selectIndex{
    _selectIndex = selectIndex;
}
- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont ? titleFont : Font(14);
    for (int i=0; i<_titles.count; i++) {
        UIButton *btn= buttons[i];
        btn.titleLabel.font=_titleFont;
    }
}

@end



@implementation UIView (Category)

#pragma mark-- setter,getter方法(深度赋值，取值)--
- (void) setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame=CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);
    self.frame=frame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void) setY:(CGFloat)y{
    CGRect frame=self.frame;
    frame=CGRectMake(frame.origin.x, y, frame.size.width, frame.size.height);
    self.frame=frame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void) setW:(CGFloat)w{
    CGRect frame=self.frame;
    frame=CGRectMake(frame.origin.x, frame.origin.y, w, frame.size.height);
    self.frame=frame;
}
- (CGFloat)w{
    return self.frame.size.width;
}
- (void) setH:(CGFloat)h{
    CGRect frame=self.frame;
    frame=CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, h);
    self.frame=frame;
}
- (CGFloat)h{
    return self.frame.size.height;
}

@end
