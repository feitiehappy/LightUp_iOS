//
//  HPQuestionCell.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HPQuestionCell.h"
#import "Utils.h"

#import <DateTools/DateTools.h>

@implementation HPQuestionCell

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"bwztId": @"bwztid",
             @"uId": @"uid",
             @"userName": @"username",
             @"title": @"subject",
             @"contentText": @"message",
             @"bwztClassId": @"bwztdivisionid",
             @"bwztDivisionId": @"bwztdivisionid",
             @"sex": @"sex",
             @"age": @"age",
             @"viewNum": @"viewnum",
             @"replyNum": @"replynum",
             @"hot": @"hot",
             @"dateline": @"dateline",
             @"questionStatus": @"status",
             @"name": @"name",
             @"pics": @"pics",
             @"avatarUrl": @"avatar_url"
             };
}

+ (NSValueTransformer *)picsJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSArray *array, BOOL *success, NSError **error){
        if(array == nil) return @[];
        NSMutableArray *urlArray = [[NSMutableArray alloc] init];
        for (NSDictionary *item in array) {
            [urlArray addObject:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_URL, item[@"picurl"]]]];
        }
        return [NSArray arrayWithArray:urlArray];
    } reverseBlock:^(NSArray *array, BOOL *success, NSError **error) {
        // 这一段block不知道有啥用
        // 下次省略
        return array;
    }];
}

+ (NSValueTransformer *)datelineJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error) {
        NSDate *timeAgoDate = [NSDate dateWithTimeIntervalSince1970:str.floatValue];
        return timeAgoDate.timeAgoSinceNow;
    }reverseBlock:^(NSString *time, BOOL *success, NSError **error) {
        return time;
    }];
}

@end
