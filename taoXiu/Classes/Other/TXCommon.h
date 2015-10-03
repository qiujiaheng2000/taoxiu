//
//  TXCommon.h
//  taoXiu
//
//  Created by jhqiu on 15/9/22.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//
/**
 *  公共的相关信息可以保存在这个公共类当中
 *
 */

//账号信息
//#define IWAppKey @"1359433872"
//#define IWAppSecret @"37c372aa97a9329fc561947151c1bd38"
//#define IWRedirectURI @"http://ios.itcast.cn"
#define IWAppKey @"101386739"
#define IWAppSecret @"421610bf3576f53d35d4f9855a63b37e"
#define IWRedirectURI @"http://www.langfangyh.com"
#define IWLoginURL [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@", IWAppKey, IWRedirectURI]

// 1.判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

// 2.获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.自定义Log
#ifdef DEBUG
#define TXLog(...) NSLog(__VA_ARGS__)
#else
#define TXLog(...)
#endif

// 4.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

// 5.动态cell上面的属性
/** 昵称的字体 */
#define TXStatusNameFont [UIFont systemFontOfSize:15]
/** 被转发微博作者昵称的字体 */
//#define IWRetweetStatusNameFont IWStatusNameFont

/** 时间的字体 */
#define TXStatusTimeFont [UIFont systemFontOfSize:12]
/** 来源的字体 */
//#define TXStatusSourceFont IWStatusTimeFont

/** 正文的字体 */
#define TXStatusContentFont [UIFont systemFontOfSize:13]
/** 被转发微博正文的字体 */
//#define IWRetweetStatusContentFont IWStatusContentFont

/** 表格的边框宽度 */
#define TXStatusTableBorder 5

/** cell的边框宽度 */
#define TXStatusCellBorder 10

// 6.微博cell内部相册
#define TXPhotoW 70
#define TXPhotoH 70
#define TXPhotoMargin 10

// 7.常用的对象
#define IWNotificationCenter [NSNotificationCenter defaultCenter]