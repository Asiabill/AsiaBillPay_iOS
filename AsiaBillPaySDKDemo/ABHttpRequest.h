//
//  ABHttpRequest.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/8/17.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestCompletionBlock)(NSDictionary * _Nullable responseObject, NSError * _Nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface ABHttpRequest : NSObject

+ (void)createSessionTokenWithMerNo:(NSString *)merNo gatewayNo:(NSString *)gatewayNo completionBlock:(RequestCompletionBlock)completionBlock;

+ (void)createCustomerIdWithSessionToken:(NSString *)sessionToken completionBlock:(RequestCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
