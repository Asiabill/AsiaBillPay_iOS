//
//  ABPayOrderInfo.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/25.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABPayOrderInfo : NSObject
/** 必填参数 */

/** 商户号 */
@property (nonatomic,copy) NSString *merNo;

/** 网关接入号 */
@property (nonatomic,copy) NSString *gatewayNo;

/** 商户订单号 */
@property (nonatomic,copy) NSString *orderNo;

/** 交易币种 */
@property (nonatomic,copy) NSString *orderCurrency;

/** 交易金额,只限小数点后两位 */
@property (nonatomic,copy) NSString *orderAmount;

/** 支付方式 */
@property (nonatomic,copy) NSString *paymentMethod;

/** 信用卡卡种 */
@property (nonatomic,strong) NSArray *CardType;

/** 名 */
@property (nonatomic,copy) NSString *firstName;

/** 姓 */
@property (nonatomic,copy) NSString *lastName;

/** 邮件 */
@property (nonatomic,copy) NSString *email;

/** 电话 */
@property (nonatomic,copy) NSString *phone;

/** 账单国家 */
@property (nonatomic,copy) NSString *country;

/** 客人的账单城市 */
@property (nonatomic,copy) NSString *city;

/** 客人的账单地址 */
@property (nonatomic,copy) NSString *address;

/** 客人的邮编 */
@property (nonatomic,copy) NSString *zip;

/** 客户端类型 */
@property (nonatomic,assign) NSInteger isMobile;

/** signkey */
@property (nonatomic,copy) NSString *signkey;

/** 信用卡支付方式 */
@property (nonatomic,copy) NSString *TokenPayType;


/** 2.0信用卡输入信息,用户不需要传,输入即可 */
/** 卡号 */
@property (nonatomic,copy) NSString *cardNo;

/** 有效期 - 年 */
@property (nonatomic,copy) NSString *cardExpireYear;

/** 有效期 - 月 */
@property (nonatomic,copy) NSString *cardExpireMonth;

/** CVV */
@property (nonatomic,copy) NSString *cardSecurityCode;






/** 非必填参数 */

/** 支付环境 0:测试环境; 1:仿真环境; 2:线上生产环境 (支付环境不传默认是线上环境 2) */
@property (nonatomic,assign) NSInteger paymentsEnvironment;

/** 客人的所在州 */
@property (nonatomic,copy) NSString *state;

/** 后台通知地址 */
@property (nonatomic,copy) NSString *callbackUrl;

/** 备注 */
@property (nonatomic,copy) NSString *remark;

/** tokenType */
@property (nonatomic,copy) NSString *tokenType;

/** 商品详情 */
@property (nonatomic,strong) NSArray *goodsDetail;






/// 获取订单信息串
- (NSString *)getPayOrderInfo;


/// 字典转模型
/// @param dict 字典
+ (instancetype)itemWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
