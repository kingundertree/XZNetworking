//
//  XZRequestManager.m
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XZRequestManager.h"
#import "XZApiManager.h"
#import "XZRequestResponse+XZNetMethod.h"
#import "AFNetworkReachabilityManager.h"

@implementation XZRequestManager

+ (id)shareInstance{
    static dispatch_once_t pred;
    static XZRequestManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[XZRequestManager alloc] init];
    });
    return sharedInstance;
}

+ (void)initServieId
{
}

+ (BOOL)isNetWorkReachable{
    
    
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
        return NO;
    }
    return YES;
}


#pragma mark --Normal request
- (XZRequestID)asyncGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action
{
    NSInteger requestId = [[XZApiManager shareInstance] callGETWithParams:params
                                                        serviceIdentifier:serviceID
                                                               methodName:methodName
                                                                  success:^(XZRequestResponse *response)
    {
        if ([target respondsToSelector:action]) {
            [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
        }
    } fail:^(XZRequestResponse *response) {
        if ([target respondsToSelector:action]) {
            [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
        }
    }];
    
    return (XZRequestID)requestId;
}


- (XZRequestID)asyncPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action{
    NSInteger requestId = [[XZApiManager shareInstance] callPostWithParams:params
                                                         serviceIdentifier:serviceID
                                                                methodName:methodName
                                                                   success:^(XZRequestResponse *response)
                           {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           } fail:^(XZRequestResponse *response) {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           }];
    
    return (XZRequestID)requestId;
}

- (XZRequestResponse *)syncGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    if ([self isRest:serviceID]) {
        return [self syncRESTGetWithServiceID:serviceID methodName:methodName params:params];
    }
    
    return [[XZApiManager shareInstance] callGETWithParams:params serviceIdentifier:serviceID methodName:methodName];
}
- (XZRequestResponse *)syncPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    if ([self isRest:serviceID]) {
        return [self syncRESTGetWithServiceID:serviceID methodName:methodName params:params];
    }

    return [[XZApiManager shareInstance] callPostWithParams:params
                                          serviceIdentifier:serviceID
                                                 methodName:methodName];
    
}

#pragma mark - REST
- (XZRequestID)asyncRESTGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action{
    NSInteger requestId = [[XZApiManager shareInstance] callRestfulGETWithParams:params
                                                               serviceIdentifier:serviceID methodName:methodName
                                                                         success:
                           ^(XZRequestResponse *response)
                           {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           }fail:^(XZRequestResponse *response)
                           {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           }];

    
    return (XZRequestID)requestId;
}

- (XZRequestID)asyncRESTPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action{
    NSInteger requestId = [[XZApiManager shareInstance] callRestfulPOSTWithParams:params
                                                                serviceIdentifier:serviceID
                                                                       methodName:methodName
                                                                          success:^(XZRequestResponse *response)
                           {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           }
                                                                             fail:^(XZRequestResponse *response)
                           {
                               if ([target respondsToSelector:action]) {
                                   [target performSelector:action withObject:[response returnNetworkResponse] afterDelay:0.0];
                               }
                           }];

    return (XZRequestID)requestId;
}
- (XZRequestResponse *)syncRESTPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    return [[XZApiManager shareInstance] callRestfulPOSTWithParams:params serviceIdentifier:serviceID methodName:methodName];
}

- (XZRequestResponse *)syncRESTGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    return [[XZApiManager shareInstance] callRestfulGETWithParams:params serviceIdentifier:serviceID methodName:methodName];
}

#pragma mark - Cancel requests
- (void)cancelRequest:(XZRequestID)requestID
{
    [[XZApiManager shareInstance] cancelRequestWithRequestID:@(requestID)];
}

- (void)cancelRequestsWithTarget:(id)target
{
    
}

- (BOOL)isRest:(NSString *)serviceID{
    if ([serviceID isEqualToString:XZNetworkingRestfulGetServiceID] || [serviceID isEqualToString:XZNetworkingRestfulPostServiceID]) {
        return YES;
    }
    
    return NO;
}


@end
