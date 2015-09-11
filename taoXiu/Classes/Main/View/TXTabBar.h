//
//  TXTabBar.h
//  taoXiu
//
//  Created by jhqiu on 15/9/11.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TXTabBar;

@protocol TXTabBarDelegate <NSObject>

@optional
-(void)tabbar:(TXTabBar *)tabbar didSelectedButtonFrom:(int) from to:(int) to;

@end

@interface TXTabBar : UIView
-(void)addTabbarButtonWithItem:(UITabBarItem *)item;

@property(nonatomic,weak) id<TXTabBarDelegate> delegate;
@end
