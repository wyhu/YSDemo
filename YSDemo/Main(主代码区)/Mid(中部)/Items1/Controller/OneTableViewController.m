//
//  OneTableViewController.m
//  YSDemo
//
//  Created by huweiya on 16/8/22.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "OneTableViewController.h"
#import "OneViewController.h"
#import "MMPlaceHolder.h"
#import "AppDelegate.h"
#import "ProvinceModel.h"
#import "CityModel.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "HUAdsScrollView.h"
#import <EventKit/EventKit.h>
@interface OneTableViewController ()
<UITextViewDelegate>
{
    BOOL _openArray[50];
    
}



@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation OneTableViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIDevice *deviceType = [UIDevice currentDevice];
    
    NSLog(@"%ld",deviceType.orientation);
    
    [IQKeyboardManager sharedManager].shouldShowTextFieldPlaceholder  = NO;
    
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    //    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
    [IQKeyboardManager sharedManager].preventShowingBottomBlankSpace = NO;
    
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 500.0;
    
    
    
    [self deal];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 40, 40)];
    
    [btn addTarget:self action:@selector(redBtnA) forControlEvents:UIControlEventTouchUpInside];
    
    btn.backgroundColor = [UIColor redColor];
    
    [btn setImage:[UIImage imageNamed:@"battle_friend_bkg_big"] forState:0];
    
    [btn setTitle:@"点击登陆" forState:0];
    
    [AppkeyWindow addSubview:btn];
    
    
}

- (void)redBtnA{
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
}


- (void)hehe{
    
    UIViewController *vc = [[UIViewController alloc] init];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    vc.title = @"你好";
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(BOOL)isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        return NO;
    }
    
    return isExistenceNetwork;
}


- (void)deal{
    //创建网络监听管理者对象
    __weak AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    NSLog("-----%d",manager.reachable);
    
    /*
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,//未识别的网络
     AFNetworkReachabilityStatusNotReachable     = 0,//不可达的网络(未连接)
     AFNetworkReachabilityStatusReachableViaWWAN = 1,//2G,3G,4G...
     AFNetworkReachabilityStatusReachableViaWiFi = 2,//wifi网络
     };
     */
    //设置监听
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别的网络");
                [manager stopMonitoring];
                
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"不可达的网络(未连接)");
                [manager stopMonitoring];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G...的网络");
                [manager stopMonitoring];
                
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi的网络");
                
                [manager stopMonitoring];
                
                break;
            default:
                break;
        }
    }];
    //开始监听
    [manager startMonitoring];
    
    NSLog("-----%d",manager.reachable);
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSLog(@"%d",[self isConnectionAvailable]);
    
    
    [IQKeyboardManager sharedManager].enable = NO;
    
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"Provineces" ofType:@"plist"];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistPath];
    
    _dataArr = [ProvinceModel mj_objectArrayWithKeyValuesArray:arr];
    
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIButton *label = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, YSWidth, 20)];
    
    label.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    ProvinceModel *pro = self.dataArr[section];
    
    NSString *text = [NSString stringWithFormat:@"    %@ %@",pro.ID,pro.ProvinceName];
    
    [label setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [label setTitleColor:[UIColor blackColor] forState:0];
    label.tag = 200 + section;
    
    [label addTarget:self action:@selector(btnA:) forControlEvents:UIControlEventTouchUpInside];
    
    [label setTitle:text forState:0];
    
    return label;
    
    
}


- (void)btnA:(UIButton *)btn
{
    _openArray[btn.tag - 200] = !_openArray[btn.tag - 200];
    
    NSIndexSet *indexSet=[NSIndexSet indexSetWithIndex:btn.tag - 200];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
    BOOL open = _openArray[section];
    
    if (open) {
        NSArray *cityArr = [self.dataArr[section] cities];
        
        return cityArr.count;
        
    }else{
        
        return 0;
        
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    
    NSArray *cityArr = [self.dataArr[indexPath.section] cities];
    
    CityModel *city = cityArr[indexPath.row];
    
    cell.textLabel.text = city.ID;
    
    cell.detailTextLabel.text = city.CityName;
    
    
    return cell;
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
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



//添加索引列

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView

{
    
    NSMutableArray *arr  = [NSMutableArray array];
    
    for (int i = 0; i < self.dataArr.count; i++) {
        
        [arr addObject:[self.dataArr[i] ProvinceName]];
    }
    
    return arr;
    
}

//索引列点击事件

//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//
//{
//
//
//
//    [tableView
//     scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
//     atScrollPosition:UITableViewScrollPositionTop animated:YES];
//
//
//    return index+4;
//
//}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
}



@end
