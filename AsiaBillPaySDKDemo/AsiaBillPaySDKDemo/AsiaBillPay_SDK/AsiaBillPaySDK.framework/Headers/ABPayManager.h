//
//  ABPayManager.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/8.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ABPublicDefine.h"
@class ABPayOrderInfo;

NS_ASSUME_NONNULL_BEGIN

@interface ABPayManager : NSObject

/// 创建支付单例管理者,返回单例对象
+ (instancetype)sharedManager;


/// 支付接口
/// @param orderInfo 订单信息
/// @param schemeStr 调用支付的app注册在info.plist中的scheme (暂时无用,传空就行,例:@"")
/// @param completionBlock 支付结果回调Block
- (void)payOrder:(ABPayOrderInfo *)orderInfo fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock;


/// 处理第三方app支付后跳回商户app携带的支付结果url
/// @param resultUrl 第三方app返回的支付结果url
/// @param completionBlock 支付结果回调Block
- (void)processOrderWithPaymentResult:(NSURL *)resultUrl standbyCallback:(CompletionBlock)completionBlock;


@end

NS_ASSUME_NONNULL_END
