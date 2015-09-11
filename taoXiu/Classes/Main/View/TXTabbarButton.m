//
//  TXTabbarButton.m
//  taoXiu
//
//  Created by jhqiu on 15/9/11.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//


// 图标的比例
#define TXTabbarButtonImageRatio 0.6

//按钮的默认文字颜色
#define TXTabbarButtonTitleColor (iOS7 ? [UIColor blackColor]: [UIColor whiteColor])
//按钮的选中的文字的颜色
#define TXTabbarButtonTitleSelectedColor (iOS7 ? IWColor(234, 103, 7) : IWColor(248, 139, 0) )

#import "TXTabbarButton.h"
#import "TXBadgeView.h"

@interface TXTabbarButton()

@property(nonatomic,weak)TXBadgeView *badgeView;

@end

@implementation TXTabbarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
/**
*  初始化的时候
*
*  @param frame
*
*  @return
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        //文字颜色
        [self setTitleColor:TXTabbarButtonTitleColor forState:UIControlStateNormal];
        //文字选中颜色
        [self setTitleColor:TXTabbarButtonTitleSelectedColor forState:UIControlStateSelected];
        
        if (!iOS7) { // 非iOS7下,设置按钮选中时的背景
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        
        
        //添加一个数字提醒按钮
        TXBadgeView *badgeView = [[TXBadgeView alloc] init];
        badgeView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeView];
        self.badgeView = badgeView;
    }
    return self;
}


-(void)setHighlighted:(BOOL)highlighted{
    
}

/**
 * 重写按钮的图片的方法 获取指定的图片的尺寸
 */
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * TXTabbarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
/**
 * 重写按钮的title的方法 获取指定的title的尺寸
 */
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * TXTabbarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item
{
    _item = item;
    //添加监听，监听系统原生的 UITabBarItem 的属性的变化
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    // 设置文字
    [self setTitle:self.item.title forState:UIControlStateSelected];
    [self setTitle:self.item.title forState:UIControlStateNormal];
    
    // 设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    
    //设置badge的提醒内容
    self.badgeView.badgeValue = self.item.badgeValue;

    // 设置提醒数字的位置
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeView.frame.size.width - 10;
    CGRect badgeF = self.badgeView.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;
    self.badgeView.frame = badgeF;

}
@end
