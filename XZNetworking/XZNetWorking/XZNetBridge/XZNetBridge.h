//
//  XZNetBridge.h
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger XZMusicGetServiceID;


@interface XZNetBridge : NSObject

+ (id)sharedInstance;
+ (void)initServieId;

+ (NSString *)bridgeServiceWithId:(unsigned int)serviceId;

@end
