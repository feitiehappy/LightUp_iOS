//
//  RootViewController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/12.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)awakeFromNib {
    self.parallaxEnabled = NO;  // 视差
    self.scaleContentView = YES;
    self.contentViewScaleValue = 0.68;
    self.scaleMenuView = NO;
    self.contentViewShadowEnabled = YES;
    self.contentViewShadowRadius = 1.5;
    
    self.contentViewController = [self.storyboard
                                  instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
