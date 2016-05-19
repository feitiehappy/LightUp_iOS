//
//  HPQuestionCell.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//
//  主页的问题表格的cell的数据模型

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface HPQuestionCell : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString *bwztId;   // 咨询id
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *contentText;  // 咨询正文
@property (nonatomic, copy) NSString *bwztClassId;  // 咨询分类id
@property (nonatomic, copy) NSString *bwztDivisionId;   // 科室分类id
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *viewNum;  // 浏览次数
@property (nonatomic, copy) NSString *replyNum; // 回复次数
@property (nonatomic, copy) NSString *hot;      // 热度
@property (nonatomic, copy) NSString *dateline; // 时间
@property (nonatomic, copy) NSArray *pics;   // 图片数组
/**
 *  咨询状态。0: 打开， 1: 关闭
 */
@property (nonatomic, copy) NSString *questionStatus;
@property (nonatomic, copy) NSString *uId;      // 发布咨询的用户id
@property (nonatomic, copy) NSString *userName; // 用户名
@property (nonatomic, copy) NSString *name; // 真名
@property (nonatomic, copy) NSURL *avatarUrl;   // 头像地址

@end
