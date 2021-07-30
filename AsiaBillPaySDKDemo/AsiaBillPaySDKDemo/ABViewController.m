//
//  ABViewController.m
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/6/28.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import "ABViewController.h"
#import <AsiaBillPaySDK/AsiaBillPaySDK.h>

#define AB_SUBVIEW_XGAP   (20.0f)
#define AB_SUBVIEW_YGAP   (30.0f)
#define AB_SUBVIEW_WIDTH  (([UIScreen mainScreen].bounds.size.width) - 2 * (AB_SUBVIEW_XGAP))

#define AB_BUTTON_HEIGHT  (60.0f)
//#define AB_INFO_HEIGHT    (200.0f)

@interface ABViewController ()
/** 支付环境 */
@property (weak, nonatomic) IBOutlet UITextField *paymentsEnvironmentTF;
/** 商户号 */
@property (weak, nonatomic) IBOutlet UITextField *merNoTF;
/** 网关号 */
@property (weak, nonatomic) IBOutlet UITextField *gatewayNoTF;
/** 交易金额 */
@property (weak, nonatomic) IBOutlet UITextField *orderAmountTF;
/** 交易币种 */
@property (weak, nonatomic) IBOutlet UITextField *orderCurrencyTF;
/** 支付方式 */
@property (weak, nonatomic) IBOutlet UITextField *paymentMethodTF;

@end

@implementation ABViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutVCSubView];
    
    [self setTextFieldColor];
    
}

- (void)setTextFieldColor
{
    [self setTextFieldBorderColorWith:_paymentsEnvironmentTF];
    
    [self setTextFieldBorderColorWith:_merNoTF];
    
    [self setTextFieldBorderColorWith:_gatewayNoTF];
    
    [self setTextFieldBorderColorWith:_orderAmountTF];
    
    [self setTextFieldBorderColorWith:_orderCurrencyTF];
    
    [self setTextFieldBorderColorWith:_paymentMethodTF];
    
}

- (void)setTextFieldBorderColorWith:(UITextField *)textField
{
    textField.layer.cornerRadius = 5;
    textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.layer.masksToBounds = YES;
}

#pragma mark - 创建UI,布局
- (void)layoutVCSubView
{
    // NOTE: 全局设置
    self.title = @"支付Demo";
    self.view.backgroundColor = [UIColor whiteColor];

    // NOTE: 支付按钮，模拟支付流程
    CGFloat originalPosY = [UIApplication sharedApplication].statusBarFrame.size.height + 80.0f;
    [self generateBtnWithTitle:@"支付_2.0" selector:@selector(doABPay_2) posy:originalPosY];
    
    // NOTE: 测试按钮
    originalPosY += (AB_BUTTON_HEIGHT + AB_SUBVIEW_YGAP);
    [self generateBtnWithTitle:@"支付_1.0" selector:@selector(doABPay_1) posy:originalPosY];
}

- (void)generateBtnWithTitle:(NSString*)title selector:(SEL)selector posy:(CGFloat)posy
{
    UIButton* tmpBtn = [[UIButton alloc] initWithFrame:CGRectMake(AB_SUBVIEW_XGAP, posy, AB_SUBVIEW_WIDTH, AB_BUTTON_HEIGHT)];
    tmpBtn.backgroundColor = [UIColor colorWithRed:81.0f / 255.0f green:141.0f / 255.0f blue:229.0f / 255.0f alpha:1.0f];
    tmpBtn.layer.masksToBounds = YES;
    tmpBtn.layer.cornerRadius = 4.0f;
    [tmpBtn setTitle:title forState:UIControlStateNormal];
    [tmpBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tmpBtn];
}


#pragma mark - 点击订单模拟支付行为
- (void)doABPay_2
{
    ABPayOrderInfo *orderInfo = [self setPayOrderInfo];

    NSString *orderInfoStr = [orderInfo getPayOrderInfo];
    
    [[ABPayManager sharedManager] payOrder:orderInfoStr fromScheme:@"" callback:^(NSDictionary *resultDic) {
            
        
    }];
    
}

- (void)doABPay_1
{
    
    ABPayOrderInfo *orderInfo = [self setLocalPayOrderInfo];

    NSString *orderInfoStr = [orderInfo getPayOrderInfo];

    [[ABPayManager sharedManager] payOrder:orderInfoStr fromScheme:@"" callback:^(NSDictionary *resultDic) {
            
        NSLog(@"---1.0支付返回数据：%@",resultDic);
        
        }];
    
}

#pragma mark - 设置订单信息
//1.0
- (ABPayOrderInfo *)setLocalPayOrderInfo
{
    //生成订单信息
    ABPayOrderInfo *order = [ABPayOrderInfo new];
    
    // 商户号
    //order.merNo = @"12167";
    order.merNo = _merNoTF.text.length ? _merNoTF.text : @"12172";
    
    
    //网关接入号
    //order.gatewayNo = @"12167001";
    order.gatewayNo = _gatewayNoTF.text.length ? _gatewayNoTF.text : @"12172002";
    
    //商户订单号
    //order.orderNo = @"1624957682021";
    order.orderNo = [self getTimestamp];

    // 交易币种
    order.orderCurrency = _orderCurrencyTF.text.length ? _orderCurrencyTF.text : @"USD";

    // 交易金额,只限小数点后两位
    //order.orderAmount = @"0.1";
    order.orderAmount = _orderAmountTF.text.length ? _orderAmountTF.text : @"300";

    //支付方式
    //order.paymentMethod = @"ID_BankTransfer";
    order.paymentMethod = _paymentMethodTF.text.length ? _paymentMethodTF.text : @"ideal";

    // 名
    order.firstName = @"CL";
    
    // 姓
    order.lastName = @"BRW1";

    // 邮件
    order.email = @"532539937@qq.com";

    // 电话
    order.phone = @"1 650-555-5555";

    // 账单国家
    order.country = @"US";
    
    //州
    order.state = @"CA";

    // 客人的账单城市
    order.city = @"Mountain View";

    // 客人的账单地址
    order.address = @"1600 Amphitheatre Parkway";

    // 客人的邮编
    order.zip = @"94043";
    
    order.signkey = @"12345678";

    // 客户端类型
    order.isMobile = 2;
    
    // 支付环境 0:测试环境; 1:仿真环境; 2:线上生产环境 (支付环境不传默认是线上环境 2)
    order.paymentsEnvironment = 0;
    
    return order;

}


//2.0
- (ABPayOrderInfo *)setPayOrderInfo
{
    //生成订单信息
    ABPayOrderInfo *order = [ABPayOrderInfo new];
    
    // 商户号
    //order.merNo = @"12167";
    order.merNo = _merNoTF.text.length ? _merNoTF.text : @"12172";
    
    
    //网关接入号
    //order.gatewayNo = @"12167001";
    order.gatewayNo = _gatewayNoTF.text.length ? _gatewayNoTF.text : @"12172002";
    
    //商户订单号
    //order.orderNo = @"1624957682021";
    order.orderNo = [self getTimestamp];

    // 交易币种
    order.orderCurrency = _orderCurrencyTF.text.length ? _orderCurrencyTF.text : @"USD";

    // 交易金额,只限小数点后两位
    //order.orderAmount = @"0.1";
    order.orderAmount = _orderAmountTF.text.length ? _orderAmountTF.text : @"300";

    //支付方式
    order.paymentMethod = _paymentMethodTF.text.length ? _paymentMethodTF.text : @"Credit Card";
    
    // 信用卡卡种
//    order.CardType = @[@"Visa",@"Master card",@"American Express",@"JCB",@"Discover",@"Maestro",@"Dinners club"];
    order.CardType = @[@"JCB",@"Discover",@"Maestro",@"Dinners club"];

    // 名
//    order.firstName = @"CL";
    order.firstName = @"FL";

    // 姓
    order.lastName = @"BRW1";

    // 邮件
    order.email = @"532539937@qq.com";

    // 电话
    order.phone = @"1 650-555-5555";

    // 账单国家
    order.country = @"US";
    
    //州
    order.state = @"CA";

    // 客人的账单城市
    order.city = @"Mountain View";

    // 客人的账单地址
    order.address = @"1600 Amphitheatre Parkway";

    // 客人的邮编
    order.zip = @"94043";
    order.tokenType = @"ApplePay";
    
    order.signkey = @"12345678";

    // 客户端类型
    order.isMobile = 2;
    
    //信用卡支付方式
    order.tokenType = @"1";
    
    order.callbackUrl = @"https://testpay.asiabill.com/services/v3/CallResult";
    
    order.goodsDetail = @[@{@"goodscount":@"5",@"goodsprice":@"10",@"goodstitle":@"product one"},@{@"goodscount":@"5",@"goodsprice":@"10.6",@"goodstitle":@"product two"},@{@"goodscount":@"5",@"goodsprice":@"20.2",@"goodstitle":@"product three"}];
    
    // 支付环境 0:测试环境; 1:仿真环境; 2:线上生产环境 (支付环境不传默认是线上环境 2)
    order.paymentsEnvironment = 0;
    
 /** ********* 不需要传值得参数 ********************** */
    
//    /** 不能写死，不是商户传值 */
//    order.ip = @"113.110.142.228";
    
//    //卡号
//    order.cardNo = @"4000020951595032";
//    //年
//    order.cardExpireYear = @"2025";
//    //月
//    order.cardExpireMonth = @"12";
//    //CVV
//    order.cardSecurityCode = @"217";
    
    return order;
}

#pragma mark - 获取当前的时间戳
- (NSString *)getTimestamp
{
    NSDate *datenow = [NSDate date];
    NSTimeInterval interval = [datenow timeIntervalSince1970] *1000;
    
    return [NSString stringWithFormat:@"%.f",interval];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}

@end
