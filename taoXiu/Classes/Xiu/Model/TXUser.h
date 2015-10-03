//
//  TXUser.h
//  taoXiu
//
//  Created by jhqiu on 15/9/21.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  用户对象
 */
@interface TXUser : NSObject
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *userlevel;
@end
