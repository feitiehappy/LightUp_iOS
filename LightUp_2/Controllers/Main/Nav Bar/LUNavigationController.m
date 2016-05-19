//
//  LUNavigationController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "LUNavigationController.h"
#import "Utils.h"

@implementation LUNavigationController

- (void)viewDidLoad {
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationBar.barTintColor = THEMECOLOR;
    [self.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

@end
