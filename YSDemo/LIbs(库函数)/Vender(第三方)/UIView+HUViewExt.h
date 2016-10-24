//
//  UIView+HUViewExt.h
//  YSDemo
//
//  Created by huweiya on 16/10/20.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUViewExt)


//原点
@property CGPoint hu_origin;
//规模
@property CGSize hu_size;


/**
 四角
 */
@property (readonly) CGPoint hu_bottomLeft;
@property (readonly) CGPoint hu_bottomRight;
@property (readonly) CGPoint hu_topRight;
@property (readonly) CGPoint hu_topLeft;





/**
 四边
 */
@property CGFloat hu_height;
@property CGFloat hu_width;


@property CGFloat hu_top;
@property CGFloat hu_left;
@property CGFloat hu_bottom;
@property CGFloat hu_right;



//
//- (void) moveBy: (CGPoint) delta;
//- (void) scaleBy: (CGFloat) scaleFactor;
//- (void) fitInSize: (CGSize) aSize;
//


/**
 响应者链

 @return 响应者链
 */
- (UIViewController *)hu_viewController;


@end
