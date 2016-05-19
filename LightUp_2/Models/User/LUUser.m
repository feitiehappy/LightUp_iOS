//
//  LUUser.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "LUUser.h"

@implementation LUUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"userID": @"data.space.uid",
             @"username": @"data.space.username",
             @"name": @"data.space.name",
             @"sex": @"data.space.sex",
             @"avatarUrl": @"data.space.avatar_url",
             @"experience": @"data.space.experience",
             @"friendNum": @"data.space.friendnum",
             @"addFriendNum": @"data.space.addfriendnum",
             @"voterNum": @"data.space.voternum",
             @"age": @"data.space.age",
             @"newpm": @"data.space.newpm",
             @"allNoteNum": @"data.space.allnotenum"
             };
}

- (BOOL)isEqual:(id)object {
    if ([self class] == [object class]) {
        return self.userID == ((LUUser*)object).userID;
    }
    
    return NO;
}


@end
