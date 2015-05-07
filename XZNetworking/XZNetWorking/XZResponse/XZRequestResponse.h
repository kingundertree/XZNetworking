//
//  XZRequestResponse.h
//  XZMusic
//
//  Created by xiazer on 14/10/19.
//  Copyright (c) 2014年 xiazer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XZNetWorkingResponseStatus){
    XZNetWorkingResponseStatusSuccess,
    XZNetWorkingResponseStatusTimeOut,
    XZNetWorkingResponseStatusNetError,
    XZNetWorkingResponseStatusError
};

typedef unsigned int XZRequestID;

@interface XZRequestResponse : NSObject
@property (nonatomic, copy, readwrite) NSString *contentString;
@property(nonatomic, assign) XZRequestID requestID;
@property(nonatomic, assign) XZNetWorkingResponseStatus status;
@property (nonatomic, copy) NSDictionary *requestParams;
@property (nonatomic, copy, readwrite) id content;


- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData status:(enum XZNetWorkingResponseStatus)status;

- (instancetype)initWithResponseString:(NSString *)responseString requestId:(NSNumber *)requestId request:(NSURLRequest *)request responseData:(NSData *)responseData error:(NSError *)error;
- (void)updateWithContent:(id)content requestId:(NSInteger)requestId status:(enum XZNetWorkingResponseStatus)status;
@property (nonatomic, assign, readwrite) NSInteger requestId;

@end
