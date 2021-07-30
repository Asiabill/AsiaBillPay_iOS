//
//  ABPayManager.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/8.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABPublicDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABPayManager : NSObject

/// 创建支付单例管理者,返回单例对象
+ (instancetype)sharedManager;


/// 支付接口
/// @param externalInfo 订单信息
/// @param schemeStr 调用支付的app注册在info.plist中的scheme (暂时无用)
/// @param completionBlock 支付结果回调Block
- (void)payOrder:(NSString *)externalInfo fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
