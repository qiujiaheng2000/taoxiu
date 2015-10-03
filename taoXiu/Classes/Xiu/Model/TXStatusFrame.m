//
//  TXStatusFrame.m
//  taoXiu
//
//  Created by jhqiu on 15/9/21.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import "TXStatusFrame.h"
#import "TXUser.h"
#import "TXStatus.h"
#import "TXPhotosView.h"

/**
 *  cell对应的frame对象
 */
@implementation TXStatusFrame
/**
 *  根据传进来的动态对象计算出每个控件的frame
 *
 *  @param txStatus 动态对象模型
 */
-(void)setTxStatus:(TXStatus *)txStatus
{
    _txStatus = txStatus;
    
    //cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width - 2 * TXStatusTableBorder;
    //topview
    CGFloat topViewW = cellW;
    CGFloat topViewH = 0;
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    
    //头像
    CGFloat avatarWH = 35;
    CGFloat avatarX = TXStatusCellBorder;
    CGFloat avatarY = TXStatusCellBorder;
    
    _avatarFrame = CGRectMake(avatarX, avatarY, avatarWH, avatarWH);
    
    //昵称
    CGFloat nameLabelX = CGRectGetMaxX(_avatarFrame) + TXStatusCellBorder;
    CGFloat nameLabelY = avatarY;
    CGSize nameLebelSize = [txStatus.user.name sizeWithFont:TXStatusNameFont];
    _userNameFrame = (CGRect){{nameLabelX,nameLabelY},nameLebelSize};
    
    //vip等级图标
    CGFloat vipViewX = CGRectGetMaxX(_userNameFrame) + TXStatusCellBorder;
    CGFloat vipViewY = avatarY;
    CGFloat vipViewW = 15;
    CGFloat vipViewH = nameLebelSize.height;
    _vipFrame = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
    //发布时间
    CGFloat createAtX = nameLabelX;
    CGFloat createAtY = CGRectGetMaxY(_userNameFrame) + TXStatusCellBorder * 0.5;
    CGSize createAtSize =[ txStatus.createAt sizeWithFont:TXStatusTimeFont];
    _createAtFrame = (CGRect){{createAtX,createAtY},createAtSize};
    
    //发布的动态的内容
    CGFloat contentX = avatarX;
    CGFloat contentY = MAX(CGRectGetMaxY(_avatarFrame) , CGRectGetMaxY(_createAtFrame)) + TXStatusCellBorder * 0.5;
    CGFloat contentW = topViewW - TXStatusCellBorder * 2;
    CGSize contentSize = [txStatus.content sizeWithFont:TXStatusContentFont constrainedToSize:CGSizeMake(contentW, MAXFLOAT)];
    _contentFrame = (CGRect){{contentX,contentY},contentSize};
    
    if (txStatus.pic_urls.count) {
        CGSize photosViewSize  = [TXPhotosView photosViewSizeWithPhotosCount:txStatus.pic_urls.count];
        CGFloat photosViewX = contentX;
        CGFloat photosViewY = CGRectGetMaxY(_contentFrame) + TXStatusCellBorder;
        _photosViewFrame = (CGRect){{photosViewX,photosViewY},photosViewSize};
        topViewH = CGRectGetMaxY(_photosViewFrame) + TXStatusCellBorder;
    }else{
        topViewH = CGRectGetMaxY(_contentFrame) + TXStatusCellBorder;
    }
    _topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    
    _cellHeigh = CGRectGetMaxY(_topViewFrame) + TXStatusCellBorder;
}




@end
