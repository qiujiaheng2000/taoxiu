//
//  TXPhotosView.h
//  taoXiu
//
//  Created by jhqiu on 15/10/1.
//  Copyright © 2015年 jhqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXPhotosView : UIView
/**
 *  需要展示的图片(数组里面装的都是IWPhoto模型)
 */
@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片的个数返回相册的最终尺寸
 */
+ (CGSize)photosViewSizeWithPhotosCount:(int)count;

@end
