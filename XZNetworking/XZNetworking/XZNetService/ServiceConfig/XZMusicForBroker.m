//
//  XZMusicForBroker.m
//  XZNetworking
//
//  Created by xiazer on 15/5/8.
//  Copyright (c) 2015年 xiazer. All rights reserved.
//

#import "XZMusicForBroker.h"
#import "XZAppContext.h"

@implementation XZMusicForBroker

- (BOOL)isOnline
{
    return [[XZAppContext sharedInstance] isApiOnline];
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://api.anjuke.com/mobile-ajk-broker";
}

- (NSString *)onlineApiVersion
{
    return @"/1.0";
}

- (NSString *)onlinePrivateKey
{
    return @"4520776bd0c3bfd5";
}

- (NSString *)onlinePublicKey
{
    return @"16ef94c3684a3b93626e5694affd167e";
}

- (NSString *)offlineApiBaseUrl
{
    return @"";
}

- (NSString *)offlineApiVersion
{
    return @"";
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.offlinePublicKey;
}


@end
