//
//  UIImage+TX.m
//  taoXiu
//
//  Created by jhqiu on 15/9/10.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import "UIImage+TX.h"

@implementation UIImage (TX)
+(UIImage *)imageWithName:(NSString *)imageName
{
    if(iOS7){
        NSString *newName = [imageName stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if(image == nil){
            image = [UIImage imageNamed:imageName];
        }
        return image;
    }
    
    return [UIImage imageNamed:imageName];
}

+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

@end
