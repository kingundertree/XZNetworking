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

    [self getRequestMethodTest];
}


- (void)getRequestMethodTest {
    NSDictionary *params = @{@"songIds":@"15702101"};
    NSString *method = @"data/music/links";
    
    [[XZRequestManager shareInstance] asyncGetWithServiceID:XZNetworkingGetServiceID methodName:method params:params target:self action:@selector(getRequestReturn:)];
}

- (void)getRequestReturn:(XZRequestResponse *)response{
    NSLog(@"response---->>%@",response.content);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
