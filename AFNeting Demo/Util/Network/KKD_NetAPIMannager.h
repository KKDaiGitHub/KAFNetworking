//
//  KKD_NetAPIMannager.h
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKD_NetWorkAPI.h"
@interface KKD_NetAPIMannager : NSObject

+ (instancetype)sharedManager;

- (void)request_UserJobArrayWithBlock:(void (^)(id data, NSError *error))block;
- (void)request_TopicAdlistWithBlock:(void (^)(id data, NSError *error))block;
@end
