//
//  KKD_NetWorkAPI.h
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef enum {
    Get = 0,
    Post,
    Put,
    Delete
} NetworkMethod;


@interface KKD_NetWorkAPI : AFHTTPSessionManager


+(id)sharedJsonClient;
+(id)changeJsonClient;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                  autoShowError:(BOOL)autoShowError
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)requestJsonDataWithPath:(NSString *)aPath
                           file:(NSDictionary *)file
                     withParams:(NSDictionary*)params
                 withMethodType:(NetworkMethod)method
                       andBlock:(void (^)(id data, NSError *error))block;

- (void)uploadImage:(UIImage *)image path:(NSString *)path name:(NSString *)name
       successBlock:(void (^)(AFHTTPRequestSerializer *operation, id responseObject))success
       failureBlock:(void (^)(AFHTTPRequestSerializer *operation, NSError *error))failure
      progerssBlock:(void (^)(CGFloat progressValue))progress;
@end
