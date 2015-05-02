//
//  XZRequestManager.m
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XZRequestManager.h"
#import "XZApiManager.h"

@implementation XZRequestManager

+ (id)shareInstance{
    static dispatch_once_t pred;
    static XZRequestManager *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[XZRequestManager alloc] init];
    });
    return sharedInstance;
}

#pragma mark --Normal request
- (XZRequestID)asyncGetWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)paras target:(id)target action:(SEL)action{
    return 0;
}
- (XZRequestID)asyncPostWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)paras target:(id)target action:(SEL)action{
    return 0;
}

- (XZRequestResponse *)syncGetWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    if ([self isRest:serviceID]) {
        
    }
    
    return [[XZApiManager shareInstance] callGETWithParams:params serviceIdentifier:[XZNetBridge bridgeServiceWithId:serviceID] methodName:methodName];
    
    return nil;
}
- (XZRequestResponse *)syncPostWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSString *)params{
    return 0;
}


- (XZRequestID)asyncRESTGetWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action{
    return 0;
}

- (XZRequestID)asyncRESTPostWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params target:(id)target action:(SEL)action{
    return 0;
}

- (XZRequestResponse *)syncRESTPostWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    return 0;
}

- (XZRequestResponse *)syncRESTGetWithServiceID:(XZServiceType)serviceID methodName:(NSString *)methodName params:(NSDictionary *)params{
    return 0;
}

- (void)cancelRequest:(XZRequestID)requestID{

}


- (void)cancelRequestsWithTarget:(id)target{

}

- (BOOL)isRest:(XZServiceType)serviceID{
    if (serviceID == XZMusicGetServiceID ||
        serviceID == XZMusicPostServiceID) {
        return NO;
    }
    
    return YES;
}



@end
