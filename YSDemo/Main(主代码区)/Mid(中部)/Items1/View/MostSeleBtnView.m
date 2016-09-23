//
//  MostSeleBtnView.m
//  YSDemo
//
//  Created by huweiya on 16/9/21.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "MostSeleBtnView.h"


@interface MostSeleBtnView()
<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrV;


@property (nonatomic, strong) UIButton *lastBtn;

@end

@implementation MostSeleBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        _scrV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, YSWidth - 44, 44)];
        
        
        [self addSubview:_scrV];
        
        _scrV.showsHorizontalScrollIndicator = YES;
        
        UIView *addBtnV = [[UIView alloc] initWithFrame:CGRectMake(YSWidth - 44, 20, 44, 44)];
        
        [self addSubview:addBtnV];
        
        UIButton *addB = [UIButton buttonWithType:UIButtonTypeContactAdd];
        
        [addBtnV addSubview:addB];
        
        [addB addTarget:self action:@selector(addBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        [addB mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.center.mas_equalTo(addBtnV);
            
        
        [self addSubview:self.mainScrollV];
            
        }];
        
        
        addB.tag = 8888;
        
        

    }
    return self;
}


- (void)setTitleArr:(NSArray *)titleArr
{
    
    if (!titleArr) {
        return;
    }
    
    
    if (!self.viewArr) {
        return;
    }
    
    _titleArr = titleArr;
    
    
    for (UIButton *btn in [_scrV subviews]) {
        
        [btn removeFromSuperview];
    }
    
    
    for (UIView *btn in [self.mainScrollV subviews]) {
        
        [btn removeFromSuperview];
    }
    
    
    
    CGFloat totalW;
    

    
    for (int i = 0; i < self.titleArr.count; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        
        [btn setTitle:self.titleArr[i] forState:0];
        
        [_scrV addSubview:btn];
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = 300 + i;
        
//        btn.backgroundColor = randomColor;
        
        btn.titleLabel.font = self.titleNormalFont;
        
        
        [btn setTitleColor:self.titleNormalColor forState:0];
        
        
        //重要的是下面这部分哦！
        CGSize titleSize = [self.titleArr[i] sizeWithAttributes:@{NSFontAttributeName: self.titleSelectedFont}];
        
        titleSize.height = 44;
        titleSize.width += 20;
        
        btn.frame = CGRectMake(totalW, 0, titleSize.width, titleSize.height);
        
        totalW += titleSize.width;
        
        UIView *vi = self.viewArr[i]
        ;
        
        vi.frame = CGRectMake(i * YSWidth, 0, YSWidth, self.mainScrollV.height);
        
        
        [self.mainScrollV addSubview:self.viewArr[i]];
        
        
        if (i == 0) {
            _lastBtn = btn;
            btn.titleLabel.font = self.titleSelectedFont;
            
            [btn setTitleColor:self.titleSelectedColor forState:0];
        }
        
        
    }
    
    self.mainScrollV.contentSize = CGSizeMake(YSWidth * self.titleArr.count, self.mainScrollV.height);
    
    _scrV.contentSize = CGSizeMake(totalW, 44);
    
    
    [self.scrV setContentOffset:CGPointMake(0, 0) animated:YES];

    [self.mainScrollV setContentOffset:CGPointMake(0, 0) animated:YES];

    
}


- (void)addBtn:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(btnAction:)]) {
        [self.delegate btnAction:btn];
    }

}



- (void)btnAction:(UIButton *)btn{
    
    if (_lastBtn == btn) {
        return;
    }
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2/*延迟执行时间*/ * NSEC_PER_SEC));
    
    __weak typeof(self) weakS = self;
    
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        
        weakS.lastBtn.titleLabel.font = weakS.titleNormalFont;
        
        [weakS.lastBtn setTitleColor:weakS.titleNormalColor forState:0];
        
        
        btn.titleLabel.font = weakS.titleSelectedFont;
        
        [btn setTitleColor:weakS.titleSelectedColor forState:0];
        
//        NSLog(@"%f---%f",btn.left,btn.right);
        
        weakS.lastBtn = btn;
        
        [weakS.mainScrollV setContentOffset:CGPointMake((btn.tag - 300) * YSWidth, 0) animated:NO];

        
        if ([self.delegate respondsToSelector:@selector(btnAction:)]) {
            [self.delegate btnAction:btn];
        }
        
        
        if (btn.left < YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(0, 0) animated:YES];
            
            return;
        }
        
        if (btn.right > weakS.scrV.contentSize.width - YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(weakS.scrV.contentSize.width - weakS.scrV.width, 0) animated:YES];
            return;
        }
        
        
        
        if (btn.left > YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(btn.left - YSWidth / 3, 0) animated:YES];
            
            return;
            
        }
        
        
        
        
    });
    

    
}



- (void)delaWithBtn:(NSInteger)inte
{
    
    
    UIButton *btn = [_scrV viewWithTag:300 + inte];
    
    if (_lastBtn == btn) {
        return;
    }
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2/*延迟执行时间*/ * NSEC_PER_SEC));
    
    __weak typeof(self) weakS = self;
    
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        
        weakS.lastBtn.titleLabel.font = weakS.titleNormalFont;
        
        [weakS.lastBtn setTitleColor:weakS.titleNormalColor forState:0];
        
        
        btn.titleLabel.font = weakS.titleSelectedFont;
        
        [btn setTitleColor:weakS.titleSelectedColor forState:0];
        
        //        NSLog(@"%f---%f",btn.left,btn.right);
        
        weakS.lastBtn = btn;
        
        
        
        if ([self.delegate respondsToSelector:@selector(btnAction:)]) {
            [self.delegate btnAction:btn];
        }
        
        
        if (btn.left < YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(0, 0) animated:YES];
            
            return;
        }
        
        if (btn.right > weakS.scrV.contentSize.width - YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(weakS.scrV.contentSize.width - weakS.scrV.width, 0) animated:YES];
            return;
        }
        
        
        
        if (btn.left > YSWidth / 2) {
            [weakS.scrV setContentOffset:CGPointMake(btn.left - YSWidth / 3, 0) animated:YES];
            
            return;
            
        }
        
        
        
        
    });

    
    
    
}




- (UIScrollView *)mainScrollV
{
    if (!_mainScrollV) {
        _mainScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.scrV.bottom, YSWidth, YSHeight - 64 - 49)];
        
        _mainScrollV.pagingEnabled = YES;
        
        _mainScrollV.delegate = self;
        
        _mainScrollV.bounces = NO;
        
        _mainScrollV.backgroundColor = [UIColor yellowColor];
        
    }
    
    return _mainScrollV;
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    //    NSLog(@"%f",scrollView.contentOffset.x);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%f",scrollView.contentOffset.x);
    
    
    [self.scrV setContentOffset:CGPointMake(self.scrV.contentOffset.x, 0) animated:YES];

}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    NSLog(@"%f",scrollView.contentOffset.x);
    
    NSInteger inte = scrollView.contentOffset.x / YSWidth;
    
//    NSLog(@"%ld",inte);
    
    [self delaWithBtn:inte];
    
}




@end
