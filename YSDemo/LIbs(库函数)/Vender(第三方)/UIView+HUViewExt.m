//
//  UIView+HUViewExt.m
//  YSDemo
//
//  Created by huweiya on 16/10/20.
//  Copyright © 2016年 5i5j. All rights reserved.
//

#import "UIView+HUViewExt.h"

@implementation UIView (HUViewExt)

- (CGPoint)hu_origin
{
    return self.frame.origin;
}

- (CGSize)hu_size
{
    return self.frame.size;
}

- (CGPoint)hu_topLeft
{
    return self.frame.origin;
}

- (CGPoint)hu_topRight
{
    CGFloat x  = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


- (CGPoint)hu_bottomLeft
{
    
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return  CGPointMake(x, y);
    
    
}


- (CGPoint)hu_bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    
    
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGFloat)hu_width
{
    return self.frame.size.width;
}

- (CGFloat)hu_height
{
    return self.frame.size.height;
}


- (CGFloat)hu_top
{
    return self.frame.origin.y;
}

- (CGFloat)hu_left
{
    return self.frame.origin.x;
}

- (CGFloat)hu_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)hu_right
{
    return self.frame.origin.x + self.frame.size.width;
}


- (UIViewController *)hu_viewController
{
    
    UIResponder *next = self.nextResponder;
    
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        
        next = next.nextResponder;
        
    } while (next);
    
    return nil;
}



@end
