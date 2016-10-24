//
//  HUAdsScrollView.h
//  YSDemo
//
//  Created by huweiya on 16/10/20.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickImg)(NSInteger currPage);

@interface HUAdsScrollView : UIView

- (instancetype)initWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr titleArr:(NSArray *)titleArr;

@property (nonatomic, copy) clickImg block;

@property (nonatomic, assign) CGFloat changeTime;

- (void)setBlock:(clickImg)block;
@end
