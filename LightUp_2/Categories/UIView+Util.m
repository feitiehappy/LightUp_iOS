//
//  UIView+Util.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/14.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (void)setBorderWidth:(CGFloat)width andColor:(UIColor *)color {
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

@end
