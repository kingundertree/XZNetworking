//
//  XZRequestManager.h
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZRequestResponse.h"
#import "XZNetWorkingHeader.h"


@interface XZRequestManager : NSObject

+ (id)shareInstance;
+ (void)initServieId;
+ (BOOL)isNetWorkReachable;

#pragma mark --Normal request
- (XZRequestID)asyncGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action;
- (XZRequestID)asyncPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action;
- (XZRequestResponse *)syncGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params;
- (XZRequestResponse *)syncPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params;

#pragma mark - REST
- (XZRequestID)asyncRESTGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action;
- (XZRequestID)asyncRESTPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action;
- (XZRequestResponse *)syncRESTPostWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params;
- (XZRequestResponse *)syncRESTGetWithServiceID:(NSString *)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params;

#pragma mark - Cancel request
- (void)cancelRequest:(XZRequestID)requestID;
- (void)cancelRequestsWithTarget:(id)target;



@end
