//
//  HPQuestionCell.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HPQuestionCell.h"

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
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error){
        NSArray *array = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSASCIIStringEncoding] options:NSJSONReadingAllowFragments error:nil];
        return array;
    } reverseBlock:^(NSArray *array, BOOL *success, NSError **error) {
        return array;
    }];
}

@end
