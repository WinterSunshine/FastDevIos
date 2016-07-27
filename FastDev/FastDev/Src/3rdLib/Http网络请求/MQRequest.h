//
//  MQRequest.h
//  netWork1
//
//  Created by juefeng on 14-7-25.
//  Copyright (c) 2014年 MQ. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 结合ARC，Blocks和GCD 来实现了一个请求类的封装
 使用方法如下:
 [MQRequest request:@“hostUrl” post:@"POST参数" completeBlock:^(NSData *data) {
 dispatch_async(dispatch_get_main_queue(), ^{
 UIImage *img = [UIImage imageWithData:data];
 UIImageView *imgView = (UIImageView *)[self.view viewWithTag:10];
 imgView.image = img;
 });
 
 } errorBlock:^(NSError *error) {
 NSLog(@"error %@",error);
 }];
 
 */

/*
 * typedef Block 类型变量
 * 提高代码的可读性
 */

typedef void(^CompleteBlock_t)(NSData *data);
typedef void(^ErrorBlock_t)(NSError *error);

@interface MQRequest : NSURLConnection<NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *data_;
    CompleteBlock_t completeBlock_;
    ErrorBlock_t errorBlock_;
}

+ (id)request:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

- (id)initWithRequest:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

+ (id)Request:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

- (id)initWithrequest:(NSString *)requestUrl completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

+ (id)request:(NSString *)requestUrl post:(NSString *)postString completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

- (id)initWithRequest:(NSString *)requestUrl post:(NSString *)postString completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

+ (id)Request:(NSString *)requestUrl post:(NSString *)postStr completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

- (id)initWithrequest:(NSString *)requestUrl post:(NSString *)postStr completeBlock:(CompleteBlock_t)compleBlock errorBlock:(ErrorBlock_t)errorBlock;

@end