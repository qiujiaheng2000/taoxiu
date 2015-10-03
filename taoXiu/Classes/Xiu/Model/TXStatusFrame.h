//
//  TXStatusFrame.h
//  taoXiu
//
//  Created by jhqiu on 15/9/21.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TXStatus;
/**
 *  frame中根据模型计算所有控件的frame
 */
@interface TXStatusFrame : NSObject
@property(nonatomic,strong)TXStatus *txStatus;
/**
 *  顶部的视图view
 */
@property(nonatomic,assign,readonly)CGRect topViewFrame;
/**
 *  头像
 */
@property(nonatomic,assign,readonly)CGRect avatarFrame;

/**
 *  用户名
 */
@property(nonatomic,assign,readonly)CGRect userNameFrame;
/**
 *  用户等级图标
 */
@property(nonatomic,assign,readonly)CGRect vipFrame;
/**
 *  发布时间
 */
@property(nonatomic,assign,readonly)CGRect createAtFrame;

/**
 *  发布内容
 */
@property(nonatomic,assign,readonly)CGRect contentFrame;


@property(nonatomic,assign,readonly)CGRect photosViewFrame;

/**
 *  cell的高度
 */
@property(nonatomic,assign,readonly)CGFloat cellHeigh;

@end
