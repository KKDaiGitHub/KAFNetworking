//
//  ViewController.m
//  AFNeting Demo
//
//  Created by zyg on 16/2/22.
//  Copyright © 2016年 zyg. All rights reserved.
//

#import "ViewController.h"
#import "KKD_NetAPIMannager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refreshAdlist];
    NSLog(@",,,,,,,,,,up...");
}

- (void)sendRequest{
    __weak typeof(self) weakSelf = self;
    [[KKD_NetAPIMannager sharedManager] request_UserJobArrayWithBlock:^(id data, NSError *error) {
        if (data) {
            NSLog(@"......dat.......%@",data);
        }
    }];
}

- (void)refreshAdlist {
    __weak typeof(self) wself = self;
    
    [[KKD_NetAPIMannager sharedManager] request_TopicAdlistWithBlock:^(id data, NSError *error) {

        NSLog(@"......dat.......%@",data);
    }];
}

@end
