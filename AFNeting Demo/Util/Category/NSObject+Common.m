//
//  NSObject+Common.m
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//
#define kTestKey @"BaseURLIsTest"

#import "NSObject+Common.h"
#import "UIImage+Common.h"
#import "UIColor+expanded.h"
#import "KKD_NetWorkAPI.h"
#import "JDStatusBarNotification.h"
#import "ComAPI.h"

@implementation NSObject (Common)

#pragma mark BaseURL
+ (NSString *)baseURLStr{
    NSString *baseURLStr;
    if ([self baseURLStrIsTest]) {
        //测试
        baseURLStr = kBaseUrlStr_Test;
    }else{
        //生产
        baseURLStr = kBaseUrlStr_Product;
    }
    
    return baseURLStr;
}

+ (BOOL)baseURLStrIsTest{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults valueForKey:kTestKey] boolValue];
}
+ (void)changeBaseURLStrToTest:(BOOL)isTest{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@(isTest) forKey:kTestKey];
    [defaults synchronize];
    
    [KKD_NetWorkAPI changeJsonClient];
    
    [[UINavigationBar appearance] setBackgroundImage: [UIImage imageWithColor:[UIColor colorWithHexString:isTest?@"0x3bbd79": @"0x28303b"]] forBarMetrics:UIBarMetricsDefault];
}

+ (NSString *)tipFromError:(NSError *)error{
    if (error && error.userInfo) {
        NSMutableString *tipStr = [[NSMutableString alloc] init];
        if ([error.userInfo objectForKey:@"msg"]) {
            NSArray *msgArray = [[error.userInfo objectForKey:@"msg"] allValues];
            NSUInteger num = [msgArray count];
            for (int i = 0; i < num; i++) {
                NSString *msgStr = [msgArray objectAtIndex:i];
                if (i+1 < num) {
                    [tipStr appendString:[NSString stringWithFormat:@"%@\n", msgStr]];
                }else{
                    [tipStr appendString:msgStr];
                }
            }
        }else{
            if ([error.userInfo objectForKey:@"NSLocalizedDescription"]) {
                tipStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
            }else{
                [tipStr appendFormat:@"ErrorCode%ld", (long)error.code];
            }
        }
        return tipStr;
    }
    return nil;
}
+ (BOOL)showError:(NSError *)error{
    if ([JDStatusBarNotification isVisible]) {//如果statusBar上面正在显示信息，则不再用hud显示error
        NSLog(@"如果statusBar上面正在显示信息，则不再用hud显示error");
        return NO;
    }
    NSString *tipStr = [NSObject tipFromError:error];
    [NSObject showHudTipStr:tipStr];
    return YES;
}
+ (void)showHudTipStr:(NSString *)tipStr{
    if (tipStr && tipStr.length > 0) {
//        [ComAPI showHudTipStr:tipStr];
    }
}

+ (BOOL)saveResponseData:(NSDictionary *)data toPath:(NSString *)requestPath{
    return NO;
}
+ (id) loadResponseWithPath:(NSString *)requestPath{//返回一个NSDictionary类型的json数据
    return nil;
}

+ (BOOL)deleteResponseCacheForPath:(NSString *)requestPath{
    return NO;
}

@end
