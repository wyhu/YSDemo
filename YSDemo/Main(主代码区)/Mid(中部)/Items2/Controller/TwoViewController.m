//
//  TwoViewController.m
//  YSDemo
//
//  Created by huweiya on 16/8/19.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()
@property (nonatomic, strong) UILabel *firstLabel;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.firstLabel];
    

    
    [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(100);
        
        make.left.mas_equalTo(10);
        
        make.width.mas_equalTo(YSWidth - 20);
        
//        make.height.mas_equalTo(40);
        
        
    }];
    
    
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:@"我是第一种方式，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    
    [attrStr addAttribute: NSFontAttributeName value: [UIFont fontWithName: @"Papyrus" size: 25] range: NSMakeRange(0, attrStr.length)];
    
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    
    style.lineSpacing = 15.0;
    style.firstLineHeadIndent = 20.0;
    
    style.baseWritingDirection = NSWritingDirectionRightToLeft;
    
    [attrStr addAttribute: NSParagraphStyleAttributeName value: style range: NSMakeRange(0, attrStr.length)];
    
    self.firstLabel.attributedText = attrStr;
    
}


- (UILabel *)firstLabel
{
    if (!_firstLabel) {
        
        _firstLabel = [[UILabel alloc] init];
        
        _firstLabel.backgroundColor = [UIColor yellowColor];
        
        
        _firstLabel.numberOfLines = 0;
        
        [_firstLabel sizeToFit];
        
    }
    
    return _firstLabel;
}


@end
