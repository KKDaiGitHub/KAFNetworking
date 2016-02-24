//
//  KKD_NetAPIMannager.m
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//

#import "KKD_NetAPIMannager.h"

@implementation KKD_NetAPIMannager

+ (instancetype)sharedManager {
    static KKD_NetAPIMannager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}


- (void)request_UserJobArrayWithBlock:(void (^)(id data, NSError *error))block{
    [[KKD_NetWorkAPI sharedJsonClient] requestJsonDataWithPath:@"api/options/jobs" withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        if (data) {
            id resultData = [data valueForKeyPath:@"data"];
            block(resultData, nil);
        }else{
            block(nil, error);
        }
    }];
}

- (void)request_TopicAdlistWithBlock:(void (^)(id data, NSError *error))block {
    NSString *path = @"http://203.166.163.162/app/bid/xinyongbao.do";
    [[KKD_NetWorkAPI sharedJsonClient] requestJsonDataWithPath:path withParams:nil withMethodType:Get andBlock:^(id data, NSError *error) {
        if(data) {
            id resultData = [data valueForKey:@"data"];
            block(resultData, nil);
        }else {
            block(nil, error);
        }
    }];
}
@end
