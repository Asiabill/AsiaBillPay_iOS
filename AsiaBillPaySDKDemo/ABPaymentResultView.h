//
//  ABPaymentResultView.h
//  AsiaBillPaySDKDemo
//
//  Created by 邓侃 on 2021/9/17.
//  Copyright © 2021 AsiaBill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsiaBillPaySDK/AsiaBillPaySDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABPaymentResultView : UIView
@property (weak, nonatomic) IBOutlet UILabel *toastLabel;

+ (void)show:(ResultCode)code errorDesc:(NSString *)errorStr;

@end

NS_ASSUME_NONNULL_END
