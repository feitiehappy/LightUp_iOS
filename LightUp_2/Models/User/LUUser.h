//
//  LUUser.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/13.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h> 

@interface LUUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *userID;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;   //实名
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSURL *avatarUrl;
@property (nonatomic, copy) NSNumber *experience; // 经验
@property (nonatomic, copy) NSNumber *friendNum;  // 好友数
@property (nonatomic, copy) NSNumber *addFriendNum;   // 关注数
@property (nonatomic, copy) NSNumber *voterNum;   // 参加咨询的次数
@property (nonatomic, copy) NSNumber *age;
@property (nonatomic) BOOL *newpm;   // 是否有新通知
@property (nonatomic, copy) NSNumber *allNoteNum; // 未读消息数量

@end
