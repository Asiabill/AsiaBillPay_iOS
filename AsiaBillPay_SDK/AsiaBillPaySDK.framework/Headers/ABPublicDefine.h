//
//  ABPublicDefine.h
//  AsiaBillPaySDK
//
//  Created by 邓侃 on 2021/7/30.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <UIKit/UIKit.h>

/** SDK版本号 */
FOUNDATION_EXPORT NSString * const ABPaySDK_Version;

/** 支付结果 */
typedef NS_ENUM(NSInteger, ResultCode) {
    /** 支付成功 */
    ABPaySuccess = 9900,
    /** 支付失败 */
    ABPayFail = 7700,
    /** 处理中... */
    ABPayHandling = 6600
};


/** 支付结果返回信息 */
typedef void(^CompletionBlock)(NSDictionary *resultDic);


