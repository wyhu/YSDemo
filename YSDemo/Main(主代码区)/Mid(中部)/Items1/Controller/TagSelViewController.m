//
//  TagSelViewController.m
//  YSDemo
//
//  Created by huweiya on 16/9/29.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "TagSelViewController.h"
#import "YZTagList.h"
@interface TagSelViewController ()
@property (nonatomic, strong) YZTagList *tagList;

@property (nonatomic, strong) UIScrollView *mainScrollview;

@end

@implementation TagSelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.mainScrollview];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *tags = @[@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3",@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3",@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3",@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3",@"小码哥",@"小码哥1",@"小码哥2",@"小码哥3",@"iOS学院",@"iOS学院1",@"iOS学院2",@"iOS学院3",@"吖了个峥",@"吖了个峥1",@"吖了个峥2",@"吖了个峥3"];
    
//    NSArray *tags = @[@"惊呆了时间了",@"就开了",@"放到"];
    
    // 创建标签列表
    _tagList = [[YZTagList alloc] init];
    
    _tagList.backgroundColor = [UIColor yellowColor];
    // 高度可以设置为0，会自动跟随标题计算
    _tagList.frame = CGRectMake(0, 0, YSWidth,0);
    // 设置排序时，缩放比例
    _tagList.scaleTagInSort = 1.3;
    // 需要排序
    _tagList.isSort = YES;
    // 标签尺寸
    _tagList.tagSize = CGSizeMake(80, 30);
    // 不需要自适应标签列表高度
    _tagList.isFitTagListH = YES;
    
    [self.mainScrollview addSubview:_tagList];
    
    // 设置标签背景色
    _tagList.tagBackgroundColor = [UIColor whiteColor];
    
    _tagList.tagDeleteimage = [UIImage imageNamed:@"search_delete"];
    
    // 设置标签颜色
    _tagList.tagColor = [UIColor redColor];
    
    _tagList.tagCornerRadius = 0.0;
    
    _tagList.tagMargin = 10;
    
    _tagList.tagButtonMargin = 10;
    /**
     *  这里一定先设置标签列表属性，然后最后去添加标签
     */
    [_tagList addTags:tags];
    
    [_tagList setClickTagBlock:^(NSString *tagStr) {
        
        NSLog(@"%@",tagStr);
        
    }];
    
    self.mainScrollview.contentSize = CGSizeMake(YSWidth, _tagList.hu_height);
    
    
    [self initBtn];
    
}

- (void)initBtn{
    
    //关闭
    UIButton *disBtn = [[UIButton alloc] initWithFrame:CGRectMake(YSWidth - 44, 20, 44, 44)];
    
    [self.view addSubview:disBtn];
    
    [disBtn setImage:[UIImage imageNamed:@"talent_simulator_scheme_del_press"] forState:0];
    
    [disBtn setImage:[UIImage imageNamed:@"talent_simulator_scheme_del_view"] forState:UIControlStateHighlighted];

    [disBtn addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
    
    //编辑
    
//    typedef NS_ENUM(NSInteger, UIButtonType) {
//        UIButtonTypeCustom = 0,                         // no button type
//        UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0),  // standard system button
//        
//        UIButtonTypeDetailDisclosure,
//        UIButtonTypeInfoLight,
//        UIButtonTypeInfoDark,
//        UIButtonTypeContactAdd,
//        
//        UIButtonTypeRoundedRect = UIButtonTypeSystem,   // Deprecated, use UIButtonTypeSystem instead
//    };

    
    
    UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];

    editBtn.hu_right = disBtn.hu_left - 10;
    
    editBtn.hu_top = disBtn.hu_top;
    
    [self.view addSubview:editBtn];
    
    
}








- (void)disMiss{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIScrollView *)mainScrollview
{
    if (!_mainScrollview) {
        
        _mainScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, YSWidth, YSHeight - 64)];
        
        _mainScrollview.backgroundColor = [UIColor redColor];
        
    }
    
    return _mainScrollview;
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
