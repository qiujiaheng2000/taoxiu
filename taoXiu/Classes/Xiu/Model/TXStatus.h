//
//  TXStatus.h
//  taoXiu
//
//  Created by jhqiu on 15/9/20.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//


#import <Foundation/Foundation.h>
@class TXUser;
/**
 *  首页动态对象
 */
@interface TXStatus : NSObject

@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *createAt;
@property(nonatomic,copy)NSString *commentCount;
@property(nonatomic,copy)NSString *likeCount;
@property(nonatomic,copy)NSString *readCount;
/**
 *  装的数组模型 
 */
@property(nonatomic,strong)NSArray *pic_urls;

@property(nonatomic,strong)TXUser *user;
@end
