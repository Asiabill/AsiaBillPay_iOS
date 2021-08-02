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

> **<h3>4.  组装信息请求 <h3>** 
	
APP通过初始化 ABPayOrderInfo 模型对象，将参数赋值给模型属性，调用模型方法 getPayOrderInfo 获取订单信息串，\
调用SDK支付接口。（详细可参见 Demo 中示例）
  
  
> **<h3>5. iOS sdk调用方法介绍<h3>**
  
  | 方法类型 | 示例| 
| :------ | :------ |
| 方法原型	       |    (void)payOrder:(NSString *)externalInfo fromScheme:(NSString *) schemeStr callback:(CompletionBlock)completionBlock;   |
| 方法功能	       |        提供给商户订单支付功能                                   |
| 方法参数	       |        String externalInfo 支付参数详见 4.3.2 调用支付的 app 注册在 info.plist 中的 scheme(暂时无用) Key=”value”形式，以&连接             |
| 返回值	          |        支付回调 completionBlock,resultDic支付返回参数详见 4.4       |
