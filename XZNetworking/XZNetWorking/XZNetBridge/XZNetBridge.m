//
//  XZNetBridge.m
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import "XZNetBridge.h"

static NSInteger RTServiceID = 0;
static NSArray *bridgeServiceTypeMap = nil;

// music
NSString * const NXZMusicServiceGet = @"NXZMusicServiceGet";


@interface XZNetBridge ()
@end

@implementation XZNetBridge

+ (id)sharedInstance
{
    static dispatch_once_t pred;
    static XZNetBridge *sharedInstance = nil;
    dispatch_once(&pred, ^{
        sharedInstance = [[XZNetBridge alloc] init];
    });
    return sharedInstance;
}

+ (void)initServieId{

    bridgeServiceTypeMap = @[NXZMusicServiceGet];
 
    XZMusicGetServiceID = RTServiceID;
}

+ (NSString *)bridgeServiceWithId:(unsigned int)serviceId{
    return [[XZNetBridge sharedInstance] bridgeServiceWithId:serviceId];
}

- (NSString *)bridgeServiceWithId:(unsigned int)serviceId
{
    return bridgeServiceTypeMap[serviceId];
}

+ (NSInteger)nextService{
    return ++RTServiceID;
};

@end
