//
//  TXPhotoView.m
//  taoXiu
//
//  Created by jhqiu on 15/10/1.
//  Copyright © 2015年 jhqiu. All rights reserved.
//

#import "TXPhotoView.h"
#import "TXPhoto.h"
#import "UIImageView+WebCache.h"

@interface TXPhotoView ()

@property(nonatomic,strong)UIImageView *gifView;

@end

@implementation TXPhotoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage * image = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc]initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

-(void)setPhoto:(TXPhoto *)photo
{
    _photo = photo;
    
    // 控制gifView的可见性
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@"gif"];
    
    // 下载图片
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageWithName:@"timeline_image_placeholder"]];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
}
@end
