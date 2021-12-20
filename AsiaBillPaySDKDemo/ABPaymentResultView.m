//
//  ABPaymentResultView.m
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/9/17.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import "ABPaymentResultView.h"
@interface ABPaymentResultView ()
/** 图标 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 金额币种 */
@property (weak, nonatomic) IBOutlet UILabel *amountCurrencyLB;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleLB;
/** 订单号 */
@property (weak, nonatomic) IBOutlet UILabel *orderNumberLB;
/** 支付方式 */
@property (weak, nonatomic) IBOutlet UILabel *paymentMethodLB;

@property (weak, nonatomic) IBOutlet UILabel *AlipayLB;
/** 订单号标题 */
@property (weak, nonatomic) IBOutlet UILabel *orderNumberTitleLB;
@end

@implementation ABPaymentResultView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        
        UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:myTap];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSDictionary *orderInfoDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"orderInfoDic"];
    NSString *AlipayLBText = [orderInfoDic objectForKey:@"AlipayLBText"];
    if (!AlipayLBText.length) {
        //调整Y轴
        CGFloat alertViewHeight = 50;
        
        CGRect rect = _orderNumberLB.frame;
        rect.origin.y -= alertViewHeight;
        _orderNumberLB.frame = rect;
        
        CGRect r = _orderNumberTitleLB.frame;
        r.origin.y -= alertViewHeight;
        _orderNumberTitleLB.frame = r;
    }
}


+ (void)show:(ResultCode)code
{
    CGFloat TopStatusBarH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    ABPaymentResultView *paymentResultView = [[[NSBundle mainBundle] loadNibNamed:@"ABPaymentResultView" owner:self options:nil] firstObject];
    paymentResultView.frame = CGRectMake(0, window.bounds.size.height, window.bounds.size.width, window.bounds.size.height);
    [window addSubview:paymentResultView];
    
    NSDictionary *orderInfoDic = [[NSUserDefaults standardUserDefaults] objectForKey:@"orderInfoDic"];
    paymentResultView.amountCurrencyLB.text = [NSString stringWithFormat:@"%@ %@",[orderInfoDic objectForKey:@"orderAmount"],[orderInfoDic objectForKey:@"orderCurrency"]];
    paymentResultView.orderNumberLB.text = [orderInfoDic objectForKey:@"orderNo"];
    paymentResultView.paymentMethodLB.text = [orderInfoDic objectForKey:@"paymentMethod"];
    
    // 隐藏这个
    NSString *AlipayLBText = [orderInfoDic objectForKey:@"AlipayLBText"];
    paymentResultView.AlipayLB.hidden = !AlipayLBText.length;//隐藏
    
    if (code == ABPaySuccess) { // 支付成功
        paymentResultView.iconImageView.image = [UIImage imageNamed:@"OIP.jpg"];
        paymentResultView.titleLB.text = @"支付成功";
        paymentResultView.titleLB.textColor = [UIColor colorWithRed:36.0f / 255.0f green:187.0f / 255.0f blue:186.0f / 255.0f alpha:1.0f];
        
    }else if (code == ABPayFail) { // 支付失败
        paymentResultView.iconImageView.image = [UIImage imageNamed:@"Error.jpg"];
        paymentResultView.titleLB.text = @"支付失败";
        paymentResultView.titleLB.textColor = [UIColor redColor];
        
    }else {
        
        paymentResultView.iconImageView.image = [UIImage imageNamed:@"OIP.jpg"];
        paymentResultView.titleLB.text = @"待处理...";
        paymentResultView.titleLB.textColor = [UIColor colorWithRed:36.0f / 255.0f green:187.0f / 255.0f blue:186.0f / 255.0f alpha:1.0f];
        
    }
    
    
    // 弹出动画
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat alertViewHeight = window.bounds.size.height - TopStatusBarH;
        CGRect rect = paymentResultView.frame;
        rect.origin.y -= alertViewHeight;
        paymentResultView.frame = rect;
    }];
}

- (void)dismiss
{
    CGFloat TopStatusBarH = [[UIApplication sharedApplication] statusBarFrame].size.height;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    // 关闭动画
    [UIView animateWithDuration:0.25 animations:^{
        CGFloat alertViewHeight = window.bounds.size.height - TopStatusBarH;
        CGRect rect = self.frame;
        rect.origin.y += alertViewHeight;
       self.frame = rect;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
