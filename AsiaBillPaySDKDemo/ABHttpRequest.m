//
//  ABHttpRequest.m
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/8/17.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import "ABHttpRequest.h"
#import <CommonCrypto/CommonCrypto.h>
#import "ABHeader.h"

@implementation ABHttpRequest

#pragma mark - 创建 SessionToken
+ (void)createSessionTokenWithMerNo:(NSString *)merNo gatewayNo:(NSString *)gatewayNo completionBlock:(RequestCompletionBlock)completionBlock
{
    //1.构造URL
    NSURL *url = [NSURL URLWithString:URL(@"/services/v3/sessionToken")];
    
    //2.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //2.1 设置请求方法为post
    [request setHTTPMethod:@"POST"];
    
    //2.2 设置请求参数为 json 格式
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //2.3 设置请求体
    NSString *signInfo = [self getSessionTokenSignInfoWithMerNo:merNo gatewayNo:gatewayNo];
    NSDictionary *dic = @{@"gatewayNo":gatewayNo?:@"",
                          @"merNo":merNo?:@"",
                          @"signInfo":signInfo?:@""};

    NSData *body = [NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil];
    
    [request setHTTPBody:body];
    
    //3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (data) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                
                if (completionBlock) {
                    completionBlock(dict, nil);
                }
                
            } else {
                if (completionBlock) {
                    completionBlock(nil, error);
                }
            }
            
        });
    }];
    
    [task resume];
    
}

#pragma mark - 创建 CustomerId
+ (void)createCustomerIdWithSessionToken:(NSString *)sessionToken completionBlock:(RequestCompletionBlock)completionBlock
{
    //1.构造URL
    NSURL *url = [NSURL URLWithString:URL(@"/services/v3/customers")];
    
    //2.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //2.1 设置请求方法为post
    [request setHTTPMethod:@"POST"];
    
    //2.2 设置请求参数为 json 格式
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //2.3 设置请求头
    [request setValue:sessionToken forHTTPHeaderField:@"sessionToken"];
    
    //2.4 设置请求体
    NSDictionary *dic = @{@"description":@"desc",
                          @"email":@"string0524@gmail.com",
                          @"firstName":@"zhang",
                          @"lastName":@"sang",
                          @"phone":@"18126541234"};

    NSData *body = [NSJSONSerialization dataWithJSONObject:dic options:kNilOptions error:nil];
    
    [request setHTTPBody:body];
    
    //3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (data) {
                NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                
                if (completionBlock) {
                    completionBlock(dict, nil);
                }
                
            } else {
                if (completionBlock) {
                    completionBlock(nil, error);
                }
            }
            
        });
    }];
    
    [task resume];
}


#pragma mark - 签名
+ (NSString *)getSessionTokenSignInfoWithMerNo:(NSString *)merNo gatewayNo:(NSString *)gatewayNo
{
    NSMutableDictionary *tmpDict = [NSMutableDictionary new];
    
    [tmpDict addEntriesFromDictionary:@{@"gatewayNo":gatewayNo,
                                        @"merNo":merNo}];
    
    // 排序,得出加密的字符串
    NSArray *sortedKeyArray = [[tmpDict allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSString *signInfo = @"";
    
    for (NSString *key in sortedKeyArray) {
        
        signInfo = [signInfo stringByAppendingFormat:@"%@",[tmpDict objectForKey:key]];
    }
    
    //拼接signkey
    signInfo = [signInfo stringByAppendingString:SIGNKEY];
    
    // sha256String (sha256加密) (将字符串转化为小写再加密)
    return [self sha256String:signInfo.lowercaseString];
    
}

#pragma mark - sha256加密
+ (NSString *)sha256String:(NSString *)string
{
    const char *str = string.UTF8String;
    uint8_t buffer[32];
    
    CC_SHA256(str, (CC_LONG)strlen(str), buffer);
    
    NSMutableString *strM = [NSMutableString string];
    
    for (int i = 0; i < 32; i++) {
        [strM appendFormat:@"%02x", buffer[i]];
    }
    
    return [strM copy];
}


@end
