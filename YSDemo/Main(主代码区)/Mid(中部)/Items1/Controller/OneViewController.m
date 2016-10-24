//
//  OneViewController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//



#import "OneViewController.h"
#import "MostSeleBtnView.h"
#import "TagSelViewController.h"
#import "ProvinceModel.h"
#import <MessageUI/MessageUI.h>
#import "HUNumInputView.h"
@interface OneViewController ()
<UITableViewDelegate,UITableViewDataSource,MostSelBtndelegate>

@property (nonatomic, strong) MostSeleBtnView *mView;

@property(nonatomic,strong)CALayer *myLayer;

@property(nonatomic, strong) MFMailComposeViewController *composeVC;

@end

@implementation OneViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 70, 70)];
//    [self.view addSubview:btn];
//    btn.backgroundColor = [UIColor yellowColor];
//    [btn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
//    
//    UISearchBar
//
//    [self.view addSubview:[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 110, 110)]];
    
    UITextField *textF = [[UITextField alloc] initWithFrame:CGRectMake(10, 220, 300, 50)];
    textF.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textF];
    textF.inputView.backgroundColor = [UIColor redColor];
    textF.inputView = [[HUNumInputView alloc] initIsRandom:NO mainView:textF];
    [IQKeyboardManager sharedManager].enable = NO;
    
    
    
    
}



- (void)add{
    
    
    NSLog(@"%f",[UIApplication sharedApplication].backgroundTimeRemaining);
    
}


- (void)btnAction:(UIButton *)btn
{
    if (btn.tag == 8888) {
        
        TagSelViewController *tagSe = [[TagSelViewController alloc] init];
        
        
        [self presentViewController:tagSe animated:YES completion:nil];
        
        

    }else{
        
        
        
    }
    
    
}







- (NSArray *)titleArr{
    return @[@"推荐",@"视频",@"热点",@"北京",@"社会",@"国际",@"头条号",@"图片",@"娱乐",@"正能量",@"健康",@"科技",@"天天向上",@"中国好声音"];
}


- (NSMutableArray *)viewArr{
    
    NSMutableArray *arr = [NSMutableArray array];
    
    for (int i = 0; i<[self titleArr].count; i++) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStyleGrouped];
        
        tableView.backgroundColor = [UIColor colorWithRed:(arc4random() % 10) * 0.1 green:(arc4random() % 10) * 0.1 blue:(arc4random() % 10) * 0.1 alpha:1.0];
        
        tableView.delegate = self;
        
        
        
        UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, YSWidth, 140)];
        
        la.text = [NSString stringWithFormat:@"%@",[self titleArr][i]];
        
        tableView.tableHeaderView = la;
        
        la.backgroundColor = [UIColor redColor];

        
        tableView.dataSource = self;
        
        [arr addObject:tableView];
        
    }

    return arr;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TagSelViewController *oneCtrl = [[TagSelViewController alloc] init];
    
    [self.navigationController pushViewController:oneCtrl animated:YES];
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
