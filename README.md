###github地址

	https://github.com/kingundertree/XZNetworking

###Pod支持

	pod 'XZNetworking', :git => 'https://github.com/kingundertree/XZNetworking'

###功能
	1. 支持get请求，包括同步/异步
	2. 支持post请求，包括同步/异步
	3. 支持restfulGet请求，包括同步/异步
	4. 支持restfulPost请求，包括同步/异步
	5. 支持请求细节日志打印，包括request、header、body、response等细节信息
	6. 支持系统参数传递

###实现机制
	1. 基于AFNetworking
	2. 通过NSOperationQueen管理所有的请求

###补充
	1.支持AFNetworking切换其他第三方氢气库，需要单独处理请求成功回调逻辑
	2.可以支持加密等处理

###代码片段	

####get请求

	#pragma mark - get Request
	- (void)getRequestMethodTest {
	    NSDictionary *params = @{@"songIds":@"15702101"};
	    NSString *method = @"data/music/links";
	    
	    [[XZRequestManager shareInstance] asyncGetWithServiceID:XZNetworkingGetServiceID methodName:method params:params target:self action:@selector(getRequestReturn:)];
	}
	
	- (void)getRequestReturn:(XZRequestResponse *)response {
	    NSLog(@"response---->>%@",response.content);
	}
	
####post请求

	#pragma mark - post Request
	- (void)postRequestMethodTest {
	    NSDictionary *params = @{@"log" : @"testtest"};
	    NSString *method = @"admin.writeCrashLog";
	    
	    [[XZRequestManager shareInstance] asyncPostWithServiceID:XZNetworkingPostServiceID methodName:method params:params target:self action:@selector(postRequestReturn:)];
	}
	
	- (void)postRequestReturn:(XZRequestResponse *)response {
	    NSLog(@"response---->>%@",response.content);
	}

####restfulGet请求

	#pragma mark - restfulGet Request
	- (void)restfulGetMethodTest {
	    NSDictionary *params = @{@"cityId":@"41"};
	    NSString *method = @"anjuke/prop/getconfig/";
	    
	    [[XZRequestManager shareInstance] asyncRESTGetWithServiceID:XZNetworkingRestfulGetServiceID methodName:method params:params target:self action:@selector(restfulGetRequestReturn:)];
	}
	
	- (void)restfulGetRequestReturn:(XZRequestResponse *)response {
	    NSLog(@"response---->>%@",response.content);
	}
	
####restfulPost

	#pragma mark - restfulPost Request
	- (void)restfulPostRequestMethodTest {
	    NSDictionary *params = @{@"brokerId":@"1512265",@"chatFlag":@"1",@"cityId":@"41",@"token":@"ac69cf3c7cd1c116f41e5686928bfef6"};
	    NSString *method = @"broker/getinfoandppc/";
	    
	    [[XZRequestManager shareInstance] asyncRESTPostWithServiceID:XZNetworkingRestfulPostServiceID methodName:method params:params target:self action:@selector(restfulPostRequestReturn:)];
	}
	
	- (void)restfulPostRequestReturn:(XZRequestResponse *)response {
	    NSLog(@"response---->>%@",response.content);
	}
