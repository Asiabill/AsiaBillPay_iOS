//
//  ABHeader.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/8/27.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#ifndef ABHeader_h
#define ABHeader_h

/** 网络IP地址 */
//#define BaseURL @"http://192.168.3.126:8080"
//#define BaseURL @"https://sandbox-pay.asiabill.com"
#define BaseURL @"https://safepay.asiabill.com"

/** URL */
#define URL(URL_Suffix)  [NSString stringWithFormat:@"%@%@",BaseURL,URL_Suffix]

/** 商户号 */
//#define MERNO @"12167"
#define MERNO @"12345"

/** 网关号 */
//#define GATEWAYNO @"12167005"
#define GATEWAYNO @"12345004"


/** Signkey */
//#define SIGNKEY @"2022FlX2"
//#define SIGNKEY @"12345678"
#define SIGNKEY @"Pk12345678"

/** customerId */
//#define CUSTOMER_ID @"cus_1432538803306442752"
//#define CUSTOMER_ID @"cus_1427477107420413952"
//#define CUSTOMER_ID @"cus_1460098556274282496"


/** 韩国本地支付专用 1.0 */
/** 商户号 */
#define KR_MERNO @"12230"

/** 网关号 */
#define KR_GATEWAYNO @"12230001"

/** Signkey */
#define KR_SIGNKEY @"12345678"


/** alipayconnect 1.0 */
/** 商户号 */
#define Alipay_MERNO @"12240"

/** 网关号 */
#define Alipay_GATEWAYNO @"12240001"

/** Signkey */
#define Alipay_SIGNKEY @"12345678"




#endif /* ABHeader_h */
