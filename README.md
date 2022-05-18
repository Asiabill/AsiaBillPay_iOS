**<h1>AsiaBillPay_iOS</h1>**

> Welcome to Asiabill's iOS SDK. This library will help you accept card and alternative payments in your iOS app.

**<h2>asiabill iOS sdk对接步骤</h2>**

> **<h3>1. 导入代码 <h3>**

通过 CocoaPods : pod 'AsiaBillPay' 

手动导入 ：启动 Xcode 把以下文件导入到项目中
AsiaBillPaySDK.framework
AsiaBillPaySDKResours.bundle

> **<h3>2. 项目添加配置 <h3>**

Targets –> Build Settings - > Other Linker Flags 添加 -Objc -all_load

> **<h3>3. 增加头文件引用 <h3>** 

	#import <AsiaBillPaySDK/AsiaBillPaySDK.h>
	
> **<h3>4. 添加 商户号、网关号 和 signkey （商户可以在自己的头文件进行宏定义，如下示例）<h3>**
	
	/** 商户号 */
	#define KR_MERNO @"12230"

	/** 网关号 */
	#define KR_GATEWAYNO @"12230001"

	/** Signkey */
	#define KR_SIGNKEY @"12345678"
	
	paymentsEnvironment: 支付环境 0:测试环境; 1:仿真环境; 2:线上生产环境 (支付环境不传默认是线上环境 2)

> **<h3>5.  设置订单信息 <h3>** 
	
APP通过初始化 ABPayOrderInfo 模型对象，来收集订单信息，调用SDK支付接口。（详细可参见 Demo 中示例）
	
  
> **<h3>6. iOS sdk调用方法介绍<h3>**

| 方法类型 | 示例| 
| :------ | :------ |
| 方法原型	       |    - (void)payOrder:(ABPayOrderInfo *)orderInfo fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock;   |
| 方法功能	       |        提供给商户订单支付功能                                   |
| 方法参数	       |        orderInfo (收集订单信息对象，详细请参考 SDK 的属性描述) schemeStr(暂时无用，传空字符串（@""）即可)  |
| 返回值	          |        支付回调 completionBlock, resultDic支付返回参数 （详见 7）     |
	

 > **<h3>7. ResultCode (sdk返回code码关系表) <h3>**
  
| ResultCode（返回码） | payment result（订单结果） | 
| ------ | ------ |
| 9900            |    Successful purchase  （支付成功）        |
| 7700            |    ProFailure purchase  （支付失败）        |
| 6600            |    Order pending        （交易待处理）      |
