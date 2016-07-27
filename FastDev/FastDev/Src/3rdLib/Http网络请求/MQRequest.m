//
//  MQRequest.m
//  netWork1
//
//  Created by juefeng on 14-7-25.
//  Copyright (c) 2014年 MQ. All rights reserved.
//

#import "MQRequest.h"
#import "ProgressHUD.h"
#import "Reachability.h"
#import "AppDelegate.h"
@implementation MQRequest
{
    Reachability *curReach;
}

+ (id)request:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;
{
    return [[self alloc] initWithRequest:requestUrl completeBlock:compleBlock errorBlock:errorBlock];
}

- (id)initWithRequest:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    NSString *dataUTF8 = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *dataGBK = [dataUTF8 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:dataGBK];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:15.0];
    [ProgressHUD show:nil];
    //检测网络连接
    curReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    //无网络情况下
    if ([curReach currentReachabilityStatus] == NotReachable) {
        [ProgressHUD dismiss];
//        [[UIApplication sharedApplication].delegate.window makeToast:@"无网络连接"];
    }
    if (self = [super initWithRequest:request delegate:self startImmediately:YES]) {
        data_ = [[NSMutableData alloc] init];
        completeBlock_ = [compleBlock copy];
        errorBlock_ = [errorBlock copy];
        [self start];
    }
    return self;
}

+ (id)Request:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    return [[self alloc] initWithrequest:requestUrl completeBlock:compleBlock errorBlock:errorBlock];
}
- (id)initWithrequest:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    NSString *dataUTF8 = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *dataGBK = [dataUTF8 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:dataGBK];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:15.0];
    if (self = [super initWithRequest:request delegate:self startImmediately:YES]) {
        data_ = [[NSMutableData alloc] init];
        completeBlock_ = [compleBlock copy];
        errorBlock_ = [errorBlock copy];
        [self start];
    }
    return self;
}

+ (id)request:(NSString *)requestUrl post:(NSString *)postString completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    return [[self alloc] initWithRequest:requestUrl post:postString completeBlock:compleBlock errorBlock:errorBlock];
}

- (id)initWithRequest:(NSString *)requestUrl post:(NSString *)postString completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    [ProgressHUD show:nil];
    //检测网络连接
    curReach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    //无网络情况下
    if ([curReach currentReachabilityStatus] == NotReachable) {
        [ProgressHUD dismiss];
//        [[UIApplication sharedApplication].delegate.window makeToast:@"无网络连接"];
    }
    NSURL *url = [NSURL URLWithString:requestUrl];
    NSLog(@"request Url:%@?%@",requestUrl,postString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:15.0];
    NSData *postData = [postString dataUsingEncoding:NSUTF8StringEncoding];
    //设置请求方法
    [request setHTTPMethod:@"POST"];
    //设置上传数据postData
    [request setHTTPBody:postData];
    if (self = [super initWithRequest:request delegate:self startImmediately:YES]) {
        data_ = [[NSMutableData alloc] init];
        completeBlock_ = [compleBlock copy];
        errorBlock_ = [errorBlock copy];
        [self start];
    }
    return self;
}

+ (id)Request:(NSString *)requestUrl post:(NSString *)postStr completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    return [[self alloc] initWithrequest:requestUrl post:postStr completeBlock:compleBlock errorBlock:errorBlock];
}
- (id)initWithrequest:(NSString *)requestUrl post:(NSString *)postStr completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock
{
    NSString *dataUTF8 = [requestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *dataGBK = [dataUTF8 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:dataUTF8];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                       timeoutInterval:15.0];
    //从 UTF-8 转到 GBK
//    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData *postData = [postStr dataUsingEncoding:NSUTF8StringEncoding];
    //设置请求方法
    [request setHTTPMethod:@"POST"];
    //设置上传数据
    [request setHTTPBody:postData];
    if (self = [super initWithRequest:request delegate:self startImmediately:YES]) {
        data_ = [[NSMutableData alloc] init];
        
        completeBlock_ = [compleBlock copy];
        errorBlock_ = [errorBlock copy];
        [self start];
    }
    return self;
}
#pragma mark- NSURLConnectionDataDelegate

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [data_ setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [data_ appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    completeBlock_(data_);
    [ProgressHUD dismiss];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    errorBlock_(error);
    NSLog(@"%@", [error localizedDescription]);
    [ProgressHUD dismiss];
    if ([[error localizedDescription] isEqualToString:@"The request timed out."]) {
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
//        [appDelegate.window makeToast:@"请求超时，请检查网络"];
    }
}
@end
