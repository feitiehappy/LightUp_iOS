//
//  Utils.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#ifndef Utils_h
#define Utils_h


#endif /* Utils_h */


#ifdef DEBUG
#define debugLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define debugLog(...)
#define debugMethod()
#endif


#define RGB(A, B, C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1.0]