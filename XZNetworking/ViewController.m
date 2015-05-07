//
//  ViewController.m
//  XZNetworking
//
//  Created by xiazer on 15/5/2.
//  Copyright (c) 2015年 xiazer. All rights reserved.
//

#import "ViewController.h"
#import "XZRequestManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSDictionary *params = @{@"tinguid":@"20", @"limits":@"7994"};

    NSString *method = @"restserver/ting?from=ios&version=2.4.0&method=baidu.ting.artist.getSongList&format=json&order=2&offset=0";
    
    [[XZRequestManager shareInstance] asyncGetWithServiceID:XZNetworkingGetServiceID methodName:method params:params target:self action:@selector(requestReturn:)];
}

- (void)requestReturn:(XZRequestResponse *)response{
    NSLog(@"response---->>%@",response.content);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
