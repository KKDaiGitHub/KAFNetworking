//
//  ComAPI.m
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//

#import "ComAPI.h"
#import "SVProgressHUD.h"

@implementation ComAPI

+(void)showHubActivityView:(NSString *)msg
{
    [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
    [SVProgressHUD setForegroundColor:RGBA(151,44,221,1)];
    [SVProgressHUD setRingThickness:6];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    if (msg) {
        [SVProgressHUD setStatus:msg];
    }
    [self performSelector:@selector(autoCloseHubView) withObject:nil afterDelay:60];//会造成请求提示和请求不对应
}

+(void)autoCloseHubView
{
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}

+(void)hideHubActivityView
{
    [SVProgressHUD dismiss];
}
@end
