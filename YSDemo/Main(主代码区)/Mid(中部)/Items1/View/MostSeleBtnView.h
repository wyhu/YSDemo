//
//  MostSeleBtnView.h
//  YSDemo
//
//  Created by huweiya on 16/9/21.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MostSelBtndelegate <NSObject>

- (void)btnAction:(UIButton *)btn;

@end

@interface MostSeleBtnView : UIView

//显示的标题栏的标题（必选！！）

@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) NSMutableArray *viewArr;


@property (nonatomic, strong) UIScrollView *mainScrollV;


@property (nonatomic, strong) UIColor *titleNormalColor;


@property (nonatomic, strong) UIColor *titleSelectedColor;

@property (nonatomic, strong) UIFont *titleSelectedFont;

@property (nonatomic, strong) UIFont *titleNormalFont;


@property (nonatomic, weak) id<MostSelBtndelegate> delegate;


//cursor.titles = self.titles;
////需要管理的子页面（必选！！）
//cursor.pageViews = self.pageViews;
////设置rootScrollView的高度（必选！！）
//cursor.rootScrollViewHeight = self.view.frame.size.height - 65;
//
////是否需要显示排序的按钮
//cursor.showSortbutton = YES;
////设置背景颜色
//cursor.backgroundColor = [UIColor yellowColor];
////设置最小化的字体，默认的最小值是5，小于默认值的话按默认值设置，(默认的最小值 < 设置值 <默认的最大值) 按设置的值处理
//cursor.minFontSize = 10.0;
////设置最大化的字体，默认的最大值是25，小于默认值的话按默认值设置，大于默认值按设置的值处理
//cursor.maxFontSize = 30.0;
////设置是否需要渐变字体的大小
//cursor.isGraduallyChangFont = NO;
////设置是否需要渐变字体的颜色
////在isGraduallyChangFont为NO的时候，isGraduallyChangColor不会有效果
//cursor.isGraduallyChangColor = NO;
//[self.view addSubview:cursor];



@end
