//
//  HUAdsScrollView.m
//  YSDemo
//
//  Created by huweiya on 16/10/20.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "HUAdsScrollView.h"

@interface HUAdsScrollView ()
<UIScrollViewDelegate>


@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *imgArr;
@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) UIView *infoView;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIPageControl *pageCtrl;

@property (nonatomic, strong) dispatch_source_t gcdTimer;

@end


@implementation HUAdsScrollView



- (instancetype)initWithFrame:(CGRect)frame imgArr:(NSArray *)imgArr titleArr:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgArr = imgArr;
        self.titleArr =titleArr;
        
        [self initViews];
    }
    return self;
}


- (void)initViews{
    
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.scrollView];
    
    [self addSubview:self.infoView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    
    [self addGestureRecognizer:tap];
    

}

- (void)setChangeTime:(CGFloat)changeTime
{
    _changeTime = changeTime;
    
    dispatch_resume(self.gcdTimer);

}


- (void)tap{
    
    self.block(self.pageCtrl.currentPage);

}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        _scrollView.bounces = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.frame.size.width * self.imgArr.count, self.frame.size.height);
        _scrollView.delegate = self;
        
        for (int i = 0; i < self.imgArr.count; i++) {
            
            UIImage *img;
            
            NSObject *obj = self.imgArr[i];
            
            if ([obj isKindOfClass:[UIImage class]]) {
                img = self.imgArr[i];
            }
            
            if ([obj isKindOfClass:[NSString class]]) {
                
                img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:(NSString *)obj]]];
                
            }
            
            if ([obj isKindOfClass:[NSURL class]]) {
                
                img = [UIImage imageWithData:[NSData dataWithContentsOfURL:(NSURL *)obj]];
                
            }

            
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
            [_scrollView addSubview:imgView];
            imgView.image = img;

        }
        
    }
    
    return _scrollView;
}

- (UIView *)infoView
{
    if (!_infoView) {
        
        _infoView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 55, self.frame.size.width, 55)];
        _infoView.backgroundColor = [UIColor lightGrayColor];
        
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 55)];
        titleL.backgroundColor = [UIColor redColor];
        [_infoView addSubview:titleL];
        self.titleL = titleL;
        titleL.text = self.titleArr[0];
        
        
        UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(200, 10, 100, 45)];
        page.numberOfPages = self.imgArr.count;
        page.currentPage = 0;
        [_infoView addSubview:page];
        self.pageCtrl = page;
        page.backgroundColor = [UIColor clearColor];
        
        
        
    }
    return _infoView;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger currPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    self.titleL.text = self.titleArr[currPage];
    self.pageCtrl.currentPage = currPage;
    NSLog(@"%ld",currPage);
    dispatch_resume(self.gcdTimer);

    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //暂停定时器
    dispatch_suspend(self.gcdTimer);
}


- (dispatch_source_t)gcdTimer
{
    if (!_gcdTimer) {
        
        // 获得队列
        dispatch_queue_t queue = dispatch_get_main_queue();
        
        // 创建一个定时器(dispatch_source_t本质还是个OC对象)
        _gcdTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        
        // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
        // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
        // 何时开始执行第一个任务
        // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚3秒
        dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.changeTime * NSEC_PER_SEC));
        
        uint64_t interval = (uint64_t)(self.changeTime * NSEC_PER_SEC);//周期
        
        dispatch_source_set_timer(_gcdTimer, start, interval, 0);
        
        __weak typeof(self) weakS = self;
        // 设置回调
        dispatch_source_set_event_handler(self.gcdTimer, ^{
            
            NSLog(@"%ld",weakS.pageCtrl.currentPage);
            
            
            if (weakS.pageCtrl.currentPage == self.imgArr.count - 1) {
                //滑动到最后一个了
                weakS.pageCtrl.currentPage = 0;
                weakS.titleL.text = weakS.titleArr[weakS.pageCtrl.currentPage];
                [weakS.scrollView setContentOffset:CGPointMake(self.frame.size.width * weakS.pageCtrl.currentPage, 0) animated:NO];
            }else{
                
                weakS.pageCtrl.currentPage += 1;
                weakS.titleL.text = weakS.titleArr[weakS.pageCtrl.currentPage];
                [weakS.scrollView setContentOffset:CGPointMake(self.frame.size.width * weakS.pageCtrl.currentPage, 0) animated:NO];

            }
            
            
            
        });
        
        
    }
    
    return _gcdTimer;
}




@end
