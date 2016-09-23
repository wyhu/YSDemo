//
//  MainNavigationController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()
<UINavigationControllerDelegate>

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    //返回按钮文字（写在俯视图中）
    
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:0 target:self action:@selector(pop)];
    //
    //
    //    self.navigationItem.backBarButtonItem = item;
    //
    //    //返回按钮颜色
    //    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    
    //通过图片设置返回按钮样式
        //    //自定义返回按钮
    //    UIImage *backButtonImage = [[UIImage imageNamed:@"repaire_star_h@3x"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    //
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    
    //导航栏背景
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg_for_seven"] forBarMetrics:UIBarMetricsDefault];
    
    //中间标题颜色及大小
    self.navigationBar.titleTextAttributes =@ {
        NSForegroundColorAttributeName : [UIColor whiteColor],
        NSFontAttributeName : [UIFont boldSystemFontOfSize:18]
    };
    
    
}

//自动隐藏标签栏
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
    
}





@end
