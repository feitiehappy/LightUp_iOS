//
//  Config.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "Config.h"
#import "LUUser.h"

#import <SSKeychain/SSKeychain.h>

NSString * const kService = @"LightUp";
NSString * const kAccount = @"account";
NSString * const kUserID = @"userID";

NSString * const kUserName = @"username";
NSString * const kAvatarUrl = @"avatarUrl";
NSString * const kAvatar = @"avatar";
NSString * const kExperience = @"experience";
NSString * const kFriendNum = @"friendNum";
NSString * const kAddFriendNum = @"addFriendNum";
NSString * const kVoteNum = @"voteNum";

NSString * const kSex = @"sex";
NSString * const kAge = @"age";
NSString * const kName = @"name";

// 是否有新消息
NSString * const kNewpm = @"newpm";
// 未读消息数目
NSString * const kAllNoteNum = @"allNoteNum";

@implementation Config

+ (void)saveOwnAccount:(NSString *)account andPassword:(NSString *)password {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:account ?: @"" forKey:kAccount];
    [userDefaults synchronize];
    
    [SSKeychain setPassword:password forService:kService account:account];
}


#pragma mark - user profile

+ (void)saveProfile:(LUUser *)user {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:user.userID forKey:kUserID];
    [userDefaults setObject:user.username forKey:kUserName];
    [userDefaults setObject:user.name forKey:kName];
    [userDefaults setObject:user.sex forKey:kSex];
    [userDefaults setObject:user.experience forKey:kExperience];
    [userDefaults setURL:user.avatarUrl forKey:kAvatarUrl];
    [userDefaults setObject:user.friendNum forKey:kFriendNum];
    [userDefaults setObject:user.addFriendNum forKey:kAddFriendNum];
    [userDefaults setObject:user.voterNum forKey:kVoteNum];
    [userDefaults setObject:user.age forKey:kAge];
    [userDefaults setBool:*(user.newpm) forKey:kNewpm];
    [userDefaults setObject:user.allNoteNum forKey:kAllNoteNum];
    
    [userDefaults synchronize];
}

+ (void)updateProfile:(LUUser *)user {
    [Config saveProfile:user];
}

+ (void)clearProfile {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:@(0) forKey:kUserID];
    [userDefaults setObject:@"点击头像登录" forKey:kUserName];
    [userDefaults setObject:@(0) forKey:kName];
    [userDefaults setObject:@(0) forKey:kSex];
    [userDefaults setObject:@(0) forKey:kExperience];
    [userDefaults setURL:nil forKey:kAvatarUrl];
    [userDefaults setObject:@(0) forKey:kFriendNum];
    [userDefaults setObject:@(0) forKey:kAddFriendNum];
    [userDefaults setObject:@(0) forKey:kVoteNum];
    [userDefaults setObject:@(0) forKey:kAge];
    [userDefaults setBool:0 forKey:kNewpm];
    [userDefaults setObject:@(0)forKey:kAllNoteNum];
    
    [userDefaults synchronize];
}

+ (LUUser *)myProfile {
    LUUser *user = [LUUser new];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    user.userID = [userDefaults objectForKey:kUserID];
    user.username = [userDefaults objectForKey:kUserName];
    if (!user.userID) {
        user.username = @"点击头像登录";
    }
    user.name = [userDefaults objectForKey:kName];
    user.sex = [userDefaults objectForKey:kSex];
    user.avatarUrl = [userDefaults URLForKey:kAvatarUrl];
    user.experience = [userDefaults objectForKey:kExperience];
    user.friendNum = [userDefaults objectForKey:kFriendNum];
    user.addFriendNum = [userDefaults objectForKey:kAddFriendNum];
    user.voterNum = [userDefaults objectForKey:kVoteNum];
    user.age = [userDefaults objectForKey:kAge];
    user.newpm = [userDefaults boolForKey:kNewpm];
    user.allNoteNum = [userDefaults objectForKey:kAllNoteNum];
    
    return user;
}

+ (void)saveAvatar:(UIImage *)avatar {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:UIImagePNGRepresentation(avatar) forKey:kAvatar];
    
    [userDefaults synchronize];
}

+ (NSArray *)getOwnAccountAndPassword {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *account = [userDefault objectForKey:kAccount];
    NSString *password = [SSKeychain passwordForService:kService account:account];
    
    if (account) {return @[account, password];}
    return nil;
}

+ (int64_t)getOwnID {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults integerForKey:kUserID];
}

+ (UIImage *)getAvatar {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    UIImage *avatar = [UIImage imageWithData:[userDefaults objectForKey:kAvatar]];
    
    return avatar;
}

@end
