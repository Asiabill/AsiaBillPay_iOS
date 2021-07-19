//
//  ABPublicStatusTpye.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/8.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 支付结果 */
typedef NS_ENUM(NSInteger, ResultCode) {
    /** 支付成功 */
    ABPaySuccess = 9900,
    /** 支付失败 */
    ABPayFail = 7700,
    /** 处理中... */
    ABPayHandling = 6600
};


/** 支付(查询)结果返回信息 */
typedef void(^CompletionBlock)(NSDictionary *resultDic);
/** 错误信息上传返回结果 */
typedef void(^CashCompletionBlock)(NSInteger statusCode);

