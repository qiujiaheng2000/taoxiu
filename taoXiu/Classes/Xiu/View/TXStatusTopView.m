//
//  TXStatusTopView.m
//  taoXiu
//
//  Created by jhqiu on 15/9/21.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import "TXStatusTopView.h"
#import "TXStatus.h"
#import "TXStatusFrame.h"
#import "TXUser.h"
#import "SDWebImage/UIImageView+WebCache.h"


@interface TXStatusTopView()
/**
 *  头像
 */
@property(nonatomic,weak)UIImageView *avatar;
/**
 *  用户名称
 */
@property(nonatomic,weak)UILabel *userNameLabel;
/**
 *  用户等级icon
 */
@property(nonatomic,weak)UIImageView *vipView;
/**
 *  用户发表动态的时间
 */
@property(nonatomic,weak)UILabel *createAtLabel;
/**
 *  用户发表的动态内容
 */
@property(nonatomic,weak)UILabel *contentLabel;
@end
@implementation TXStatusTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置图片
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizedImageWithName:@"timeline_card_top_background"];
        self.highlightedImage = [UIImage resizedImageWithName:@"timeline_card_top_background_highlighted"];
        //设置头像
        UIImageView *avatarView = [[UIImageView alloc]init];
        [self addSubview:avatarView];
        self.avatar = avatarView;
        //设置名称
        UILabel *userNameLabel = [[UILabel alloc]init];
        [self addSubview:userNameLabel];
        self.userNameLabel = userNameLabel;
        //设置会员图标
        UIImageView *vipView = [[UIImageView alloc]init];
        [self addSubview:vipView];
        self.vipView = vipView;
        //发布时间
        UILabel *createAt = [[UILabel alloc]init];
        [self addSubview:createAt];
        self.createAtLabel = createAt;
        //发布的内容
        UILabel *contentLabel = [[UILabel alloc] init];
        [self addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
    }
    return self;
}

-(void)setStatusFrame:(TXStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    TXStatus *status = statusFrame.txStatus;
    TXUser *user = status.user;
    
//    [self.avatar sd_setImageWithURL:NSURL placeholderImage:[UIImage imageNamed:@"avatar_default_small"]];
    

    
    
    
    
}


@end
