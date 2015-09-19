//
//  TXTabBarController.m
//  taoXiu
//
//  Created by jhqiu on 15/9/10.
//  Copyright (c) 2015年 jhqiu. All rights reserved.
//

#import "TXTabBarController.h"
#import "TXXiuTableViewController.h"
#import "TXStoreTableViewController.h"
#import "TXMeTableViewController.h" 
#import "TXTabBar.h"


@interface TXTabBarController () <TXTabBarDelegate>

@property(nonatomic,weak)TXTabBar *customTabbar;
@end

@implementation TXTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabbar
    [self setupTabbar];
    
    //初始化所有的子控制器
    [self setupAllChildViewControllers];


   }


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    // 删除系统自动生成的UITabBarButton
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupTabbar
{
    TXTabBar *customTabBar = [[TXTabBar alloc] init];
    customTabBar.frame = self.tabBar.bounds;
    customTabBar.delegate = self;
    [self.tabBar addSubview:customTabBar];
    self.customTabbar = customTabBar;
}

-(void)setupAllChildViewControllers
{
    TXXiuTableViewController *xiuController = [[TXXiuTableViewController alloc]init];
    [self setupChildViewController:xiuController title:@"淘秀" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];

    
    TXStoreTableViewController *storeController = [[TXStoreTableViewController alloc]init];
    [self setupChildViewController:storeController title:@"淘淘乐" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];

    
    TXMeTableViewController *meController = [[TXMeTableViewController alloc]init];
    [self setupChildViewController:meController title:@"我的" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];

}

-(void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //设置控制器属性
    childVc.title = title;
    //设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    //设置选中图标
    UIImage *selectedImage =[UIImage imageWithName:selectedImageName];
    if(iOS7){
        childVc.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childVc.tabBarItem.selectedImage = selectedImage;
    }

    //包装一个导航控制器
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];

    //添加tabbar内部的按钮
    [self.customTabbar addTabbarButtonWithItem:childVc.tabBarItem];
}


-(void)tabbar:(TXTabBar *)tabbar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
