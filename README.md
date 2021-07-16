**<h1>AsiaBillPay_iOS</h1>**

> Welcome to Asiabill's iOS SDK. This library will help you accept card and alternative payments in your iOS app.

**<h2>asiabill iOS sdk对接步骤</h2>**

> **<h3>1. 调用方式介绍（参照DEMO）<h3>**
  
APP通过初始化 ABPayOrderInfo 模型对象，将参数赋值给模型属性，调用模型方法 getPayOrderInfo 获取订单信息串，调用SDK支付接口。
  
> **<h3>2. iOS sdk调用方法介绍<h3>**
  
  | 方法类型 | 示例| 
| :------ | :------ |
| 方法原型	       |    (void)payOrder:(NSString *)externalInfo fromScheme:(NSString *) schemeStr callback:(CompletionBlock)completionBlock;   |
| 方法功能	       |        提供给商户订单支付功能                                   |
| 方法参数	       |        String externalInfo 支付参数详见 4.3.2 调用支付的 app 注册在 info.plist 中的 scheme(暂时无用) Key=”value”形式，以&连接             |
| 返回值	          |        支付回调 completionBlock,resultDic支付返回参数详见 4.4       |
