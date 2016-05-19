//
//  LUNetWork.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/18.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "LUNetWork.h"

@implementation LUNetWork

+ (instancetype)sharedManager {
    static LUNetWork *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"https://ucqa.dawnlightning.com/"]];
    });
    return manager;
}

- (void)requestWithMethod:(HTTPMethod)method WithPath:(NSString *)path WithParams:(NSDictionary *)params WithSuccessBlock:(requestSuccessBlock)success WithFailureBlock:(requestFailureBlock)failure {
    switch (method) {
        case GET:{
            [self GET:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                success(responseObject);
            }failure:^(NSURLSessionTask *operation, NSError *error) {
                failure(error);
            }];
            break;
        }
        case POST:{
            [self POST:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary *responseObject) {
                success(responseObject);
            }failure:^(NSURLSessionTask *task, NSError *error) {
                failure(error);
            }];
            break;
        }
        default:
            break;
    }
}

/**
 *  设置基础域名。
 *  可以设置详细的请求参数。
 *
 *  @param url 服务器地址
 *
 *  @return self
 */
-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
//    if (self) {
//        // 请求超时设定
//        self.requestSerializer.timeoutInterval = 5;
//        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
//        
//        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
//        
//        self.securityPolicy.allowInvalidCertificates = YES;
//    }
    return self;
}

@end
