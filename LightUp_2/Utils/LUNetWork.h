//
//  LUNetWork.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/18.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

// 请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

// 请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

/**
 请求方法define
 */
typedef enum {
    GET,
    POST
} HTTPMethod;

@interface LUNetWork : AFHTTPSessionManager


+ (instancetype)sharedManager;

/**
 *  简单网络请求。支持GET and POST
 *
 *  @param method  GET or POST
 *  @param path    API地址(不包括域名)
 *  @param params  参数字典
 *  @param success 请求成功的block
 *  @param failure 请求失败的block
 */
- (void)requestWithMethod:(HTTPMethod)method WithPath:(NSString *)path WithParams:(NSDictionary *)params WithSuccessBlock:(requestSuccessBlock)success WithFailureBlock:(requestFailureBlock)failure;

@end
