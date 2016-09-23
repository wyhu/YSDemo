//
//  MainTabBarController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "OneTableViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    OneViewController *aa = [[OneViewController alloc] init];
    MainNavigationController* ayNav = [[MainNavigationController alloc]initWithRootViewController:aa];
    
    TwoViewController  *bb = [[TwoViewController alloc] init];
    
    MainNavigationController* bNav = [[MainNavigationController alloc]initWithRootViewController:bb];
    
    ThreeViewController  *cc = [[ThreeViewController alloc] init];
    MainNavigationController* cNav = [[MainNavigationController alloc]initWithRootViewController:cc];
    
    FourViewController  *dd = [[FourViewController alloc] init];
    MainNavigationController* dNav = [[MainNavigationController alloc]initWithRootViewController:dd];
    
//    FiveViewController  *ee = [[FiveViewController alloc] init];
//    
//    MainNavigationController* eNav = [[MainNavigationController alloc]initWithRootViewController:ee];
    
    
    self.viewControllers=[[NSArray alloc]initWithObjects:ayNav,bNav,cNav,dNav,nil];
    
    UITabBar *tabBar = self.tabBar;
    
    UITabBarItem *aTabBarItem = [tabBar.items objectAtIndex:0];
    UITabBarItem *bTabBarItem = [tabBar.items objectAtIndex:1];
    UITabBarItem *cTabBarItem = [tabBar.items objectAtIndex:2];
    UITabBarItem *dTabBarItem = [tabBar.items objectAtIndex:3];
    
    aa.title = @"资讯";
    bb.title = @"好友";
    cc.title = @"发现";
    dd.title = @"我";
    
    aTabBarItem.title = @"资讯";
    bTabBarItem.title = @"好友";
    cTabBarItem.title = @"发现";
    dTabBarItem.title = @"我";
    
    //5.设置tabBar中items的图片
    aTabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_news_press"];
    
    
    aTabBarItem.image = [UIImage imageNamed:@"tab_icon_news_normal"];
    
    bTabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_friend_press"];
    
    bTabBarItem.image = [UIImage imageNamed:@"tab_icon_friend_normal"];
    
    cTabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_quiz_press"];
    
    cTabBarItem.image = [UIImage imageNamed:@"tab_icon_quiz_normal"];
    
    dTabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_more_press"];
    
    dTabBarItem.image = [UIImage imageNamed:@"tab_icon_more_normal"];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
