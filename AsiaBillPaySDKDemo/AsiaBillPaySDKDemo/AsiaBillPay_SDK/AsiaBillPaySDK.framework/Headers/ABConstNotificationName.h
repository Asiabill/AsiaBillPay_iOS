//
//  ABConstNotificationName.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/8.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <UIKit/UIKit.h>
/** SDK版本号 */
FOUNDATION_EXPORT NSString * const ABPaySDK_Version;
/** RSA_Key */
FOUNDATION_EXPORT NSString * const RSA_PUBLIC_KEY;
/** Signkey */
FOUNDATION_EXPORT NSString * const Signkey;



/** 海外本地支付 1.0 */
/** Web访问路径 (web URL) */
UIKIT_EXTERN NSString * const WEB_URL;
/** 查询交易结果 (搜索 URL) */
UIKIT_EXTERN NSString * const SEARCH_URL;
/** returnUrl(1.0版本写死) */
UIKIT_EXTERN NSString * const RETURN_URL;


/** 国际信用卡支付 2.0 */
/** 查询交易结果 (搜索 URL) */
UIKIT_EXTERN NSString * const SEARCH_2_URL;


/** 日志上传 URL */
UIKIT_EXTERN NSString * const UPLOAD_LOG_URL;
