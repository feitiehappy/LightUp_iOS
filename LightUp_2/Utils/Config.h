//
//  Config.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LUUser;

@interface Config : NSObject

+ (void)saveOwnAccount:(NSString *)account andPassword:(NSString *)password;

+ (void)saveProfile:(LUUser *)user;
+ (void)updateProfile:(LUUser *)user;
+ (void)clearProfile;
+ (LUUser *)myProfile;

+ (int64_t)getOwnID;

@end
