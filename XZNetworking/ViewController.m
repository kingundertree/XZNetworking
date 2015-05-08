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

    for (NSInteger i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 100+50*i, self.view.bounds.size.width, 40);
        btn.tag = 100+i;
        btn.backgroundColor = [UIColor blackColor];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        if (i == 0) {
            [btn setTitle:@"get Request" forState:UIControlStateNormal];
        } else if (i == 1) {
            [btn setTitle:@"post Request" forState:UIControlStateNormal];
        } else if (i == 2) {
            [btn setTitle:@"restfulGet Request" forState:UIControlStateNormal];
        } else if (i == 3) {
            [btn setTitle:@"restfulPost Request" forState:UIControlStateNormal];
        }
    }
}

- (void)click:(id)sender {
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag == 100) {
        [self getRequestMethodTest];
    } else if (btn.tag == 101) {
        [self postRequestMethodTest];
    } else if (btn.tag == 102) {
        [self restfulGetMethodTest];
    } else if (btn.tag == 103) {
        [self restfulPostRequestMethodTest];
    }
}


#pragma mark - get Request
- (void)getRequestMethodTest {
    NSDictionary *params = @{@"songIds":@"15702101"};
    NSString *method = @"data/music/links";
    
    [[XZRequestManager shareInstance] asyncGetWithServiceID:XZNetworkingGetServiceID methodName:method params:params target:self action:@selector(getRequestReturn:)];
}

- (void)getRequestReturn:(XZRequestResponse *)response {
    NSLog(@"response---->>%@",response.content);
}

#pragma mark - post Request
- (void)postRequestMethodTest {
    NSDictionary *params = @{@"log" : @"testtest"};
    NSString *method = @"admin.writeCrashLog";
    
    [[XZRequestManager shareInstance] asyncPostWithServiceID:XZNetworkingPostServiceID methodName:method params:params target:self action:@selector(postRequestReturn:)];
}

- (void)postRequestReturn:(XZRequestResponse *)response {
    NSLog(@"response---->>%@",response.content);
}


#pragma mark - restfulGet Request
- (void)restfulGetMethodTest {
    NSDictionary *params = @{@"cityId":@"41"};
    NSString *method = @"anjuke/prop/getconfig/";
    
    [[XZRequestManager shareInstance] asyncRESTGetWithServiceID:XZNetworkingRestfulGetServiceID methodName:method params:params target:self action:@selector(restfulGetRequestReturn:)];
}

- (void)restfulGetRequestReturn:(XZRequestResponse *)response {
    NSLog(@"response---->>%@",response.content);
}

#pragma mark - restfulPost Request
- (void)restfulPostRequestMethodTest {
    NSDictionary *params = @{@"brokerId":@"1512265",@"chatFlag":@"1",@"cityId":@"41",@"token":@"ac69cf3c7cd1c116f41e5686928bfef6"};
    NSString *method = @"broker/getinfoandppc/";
    
    [[XZRequestManager shareInstance] asyncRESTPostWithServiceID:XZNetworkingRestfulPostServiceID methodName:method params:params target:self action:@selector(restfulPostRequestReturn:)];
}

- (void)restfulPostRequestReturn:(XZRequestResponse *)response {
    NSLog(@"response---->>%@",response.content);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
