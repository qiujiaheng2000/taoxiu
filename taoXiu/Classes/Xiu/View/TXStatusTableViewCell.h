//
//  TXStatusTableViewCell.h
//  taoXiu
//
//  Created by jhqiu on 15/9/21.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TXStatusFrame;
/**
 *  首页秀的cell
 */
@interface TXStatusTableViewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic,strong)TXStatusFrame *txStatusFrame;
@end
