//
//  XZMusicForBrokerPost.m
//  XZNetworking
//
//  Created by xiazer on 15/5/8.
//  Copyright (c) 2015年 xiazer. All rights reserved.
//

#import "XZMusicForBrokerPost.h"
#import "XZAppContext.h"

@implementation XZMusicForBrokerPost

- (BOOL)isOnline
{
    return [[XZAppContext sharedInstance] isApiOnline];
}

- (BOOL)isREST
{
    return NO;
}

- (NSString *)onlineApiBaseUrl
{
    return @"http://api.anjuke.com/mobile/";
}

- (NSString *)offlineApiBaseUrl
{
    return @"http://api.anjuke.test/mobile/";
}

- (NSString *)onlineApiVersion
{
    return @"1.3";
}

- (NSString *)offlineApiVersion
{
    return @"1.3";
}

- (NSString *)onlinePublicKey
{
    return @"d945dc04a511fcd7e6ee79d9bf4b9416";
}

- (NSString *)offlinePublicKey
{
    return @"ef7545201a2bc5911cdb43527b18b8c1";
}

- (NSString *)onlinePrivateKey
{
    return @"54d22906b73b0f6d";
}

- (NSString *)offlinePrivateKey
{
    return @"79921bd362e7da67";
}

@end
