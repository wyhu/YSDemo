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
@interface OneTableViewController ()

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
    
    
    
}



- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [IQKeyboardManager sharedManager].enable = NO;
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [IQKeyboardManager sharedManager].enable = YES;
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [super numberOfSectionsInTableView:tableView];
    
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}



- (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    
    label.text = title;
    
    label.font = font;
    
    label.numberOfLines = 0;
    
    [label sizeToFit];
    
    CGFloat height = label.frame.size.height;
    
    return height;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *inen = @"hahaha";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inen];
    
    if (!cell) {
        
        __weak typeof(self) weakS = self;
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:inen];
        
        cell.detailTextLabel.numberOfLines = 0;
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        
        cell.textLabel.numberOfLines = 0;
        
        UITextField *textF = [[UITextField alloc] init];
        
        textF.backgroundColor = [UIColor redColor];
        
        textF.placeholder = @"请输入";
        
        
        [cell.contentView addSubview:textF];
        
        [textF mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(150, 30));
            
            
            make.center.mas_equalTo(cell);//居中

            
        }];
        
    }
    
    cell.imageView.image = [UIImage imageNamed:@"add_friend_recent_player"];
    
    
    
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        cell.textLabel.text = @"UIImageView\nUIImage";

    }else{
        cell.textLabel.text = @"";

    }
    
    
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

@end
