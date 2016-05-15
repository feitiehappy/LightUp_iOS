//
//  UIView+frameAdjust.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/12.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "UIView+frameAdjust.h"

@implementation UIView (frameAdjust)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.width);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.heigh);
}

- (CGFloat)heigh {
    return self.frame.size.height;
}

- (void)setHeigh:(CGFloat)heigh {
    self.frame = CGRectMake(self.x, self.y, self.width, heigh);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.heigh);
}

@end
