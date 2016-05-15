//
//  UIImageView+Util.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/14.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "UIImageView+Util.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (Util)

- (void)loadAvatar:(NSURL *)avatarURL {
    [self sd_setImageWithURL:avatarURL placeholderImage:[UIImage imageNamed:@"default-avatar"] options:0];
}

@end
