//
//  OneViewController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "OneViewController.h"
#import "MostSeleBtnView.h"
#import "FirstViewController.h"
@interface OneViewController ()

<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MostSeleBtnView *mView;


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.navigationController setNavigationBarHidden:YES];
    
    _mView = [[MostSeleBtnView alloc] initWithFrame:CGRectMake(0, 0, YSWidth, YSHeight - 64)];
    
    _mView.titleNormalFont = [UIFont systemFontOfSize:15];
    
    _mView.titleSelectedFont = [UIFont systemFontOfSize:18];
    
    _mView.titleNormalColor = [UIColor whiteColor];
    
    _mView.titleSelectedColor = [UIColor orangeColor];
    
    _mView.delegate = self;
    
    _mView.viewArr = [self viewArr];
    
    _mView.titleArr = [self titleArr];
    
    [self.view addSubview:_mView];
    
    
//    [self.view addSubview:self.mainScrollV];
    
//    [self setScrV:_mView.titleArr];
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
    
    NSLog(@"haha");
    
    UIView *topHUD = [[UIView alloc] initWithFrame:CGRectMake(0, -64, YSWidth, 64)];
    
    [AppkeyWindow addSubview:topHUD];
    
    topHUD.backgroundColor = [UIColor colorWithRed:(arc4random() % 10) * 0.1 green:(arc4random() % 10) * 0.1 blue:(arc4random() % 10) * 0.1 alpha:1.0];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        topHUD.top += 64;

    } completion:^(BOOL finished) {
        
        
        
        double delayInSeconds = 3.0;
        
        __weak typeof(self) weakSelf = self;
        
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [weakSelf haha:topHUD];
        
        
        });

        
        
    }];
    
    
    
}

- (void)haha:(UIView *)topHUD{
    
    [UIView animateWithDuration:0.5 animations:^{
        topHUD.top -= 64;
        
    } completion:^(BOOL finished) {
        
        [topHUD removeFromSuperview];
    }];

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
