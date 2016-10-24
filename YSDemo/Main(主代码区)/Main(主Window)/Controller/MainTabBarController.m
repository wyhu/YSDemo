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
    
    FiveViewController  *ee = [[FiveViewController alloc] init];
    
    MainNavigationController* eNav = [[MainNavigationController alloc]initWithRootViewController:ee];
    
    
    self.viewControllers=[[NSArray alloc]initWithObjects:ayNav,bNav,cNav,dNav,eNav,nil];
    
    UITabBar *tabBar = self.tabBar;
    
    UITabBarItem *aTabBarItem = [tabBar.items objectAtIndex:0];
    UITabBarItem *bTabBarItem = [tabBar.items objectAtIndex:1];
    UITabBarItem *cTabBarItem = [tabBar.items objectAtIndex:2];
    UITabBarItem *dTabBarItem = [tabBar.items objectAtIndex:3];
    UITabBarItem *eTabBarItem = [tabBar.items objectAtIndex:4];
    
    aa.title = @"首页";
    bb.title = @"分区";
    cc.title = @"关注";
    dd.title = @"发现";
    ee.title = @"我的";
    
    aTabBarItem.title = @"首页";
    bTabBarItem.title = @"分区";
    cTabBarItem.title = @"关注";
    dTabBarItem.title = @"发现";
    eTabBarItem.title = @"我的";
    
    
    //5.设置tabBar中items的图片
    aTabBarItem.selectedImage = [UIImage imageNamed:@"hd_home_home_tab_s"];
    aTabBarItem.image = [UIImage imageNamed:@"hd_home_home_tab"];
    
    bTabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon_friend_press"];
    bTabBarItem.image = [UIImage imageNamed:@"tab_icon_friend_normal"];
    
    cTabBarItem.selectedImage = [UIImage imageNamed:@"hd_home_attention_tab_s"];
    cTabBarItem.image = [UIImage imageNamed:@"hd_home_attention_tab"];
    
    dTabBarItem.selectedImage = [UIImage imageNamed:@"hd_home_search_tab_s"];
    dTabBarItem.image = [UIImage imageNamed:@"hd_home_search_tab"];

    eTabBarItem.selectedImage = [UIImage imageNamed:@"hd_home_mine_tab_s"];
    eTabBarItem.image = [UIImage imageNamed:@"hd_home_mine_tab"];
    

    
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
