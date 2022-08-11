**<h1>AsiaBillPay_iOS</h1>**

> Welcome to Asiabill's iOS SDK. This library will help you accept card and alternative payments in your iOS app.

**<h2>asiabill iOS sdk对接步骤</h2>**

> **<h3>1. 导入代码 <h3>**
	
> **<h4>通过 CocoaPods : <h3>**
	
	pod 'AsiaBillPay'
	
> **<h4>手动导入 : 启动 Xcode 把以下文件导入到项目中<h3>**
	
	AsiaBillPaySDK.framework
	AsiaBillPaySDKResours.bundle
	
> **<h3>2. 项目添加配置 <h3>**

	Targets –> Build Settings - > Other Linker Flags 添加 -Objc -all_load

> **<h3>3. 增加头文件引用 <h3>** 

	#import <AsiaBillPaySDK/AsiaBillPaySDK.h>
	
> **<h3>4. 信用卡支付：<h3>**
	
> **<h4>1. 创建 sessionToken （注意 sessionToken 每次交易都要创建.）<h4>**

**<h5>商户服务端调用 /sessionToken 接口创建本次交易的会话即 sessionToken。<h5>**
	
	建议商户通过服务端调用 /sessionToken 接口获取到 sessionToken
	（这里建议商户把 商户号（merNo）、网关接入号（gatewayNo）、签名密钥（signkey ）等相关参数也放到服务器和 sessionToken 一样返回），
	这些参数会用于后续支付流程的处理，商户需要从 server 端传递到 mobile 端供SDK中的API使用，请妥善保存，避免 signkey 等信息暴露在mobile客户端。

> **<h4>2. 创建 customer <h4>**
	
**<h5>顾客唯一标识 customerId（非必须）：Asiabill后台会维护一套顾客管理系统支持客户端付款时保存卡功能，方便顾客未来支付。

	商户服务端调用 创建客户接口：/customers，获取customerId。<h5>**
	
	创建成功商户可自行保存 customerId，后续先存后付、付后存卡都需要用到 customerId 来保存卡和获取已保存的卡信息列表，只有一次性付款不需要 customerId 

> **<h4>3. 收集订单信息 <h4>**
	
**<h5>APP通过初始化 ABPayOrderInfo 模型对象，来收集订单信息，调用SDK支付接口：<h5>**
	
	- (void)payOrder:(ABPayOrderInfo *)orderInfo fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock;

> **<h4>4. 发起扣款 <h4>**

**<h5>SDK 检查商户有没有传入 customerId:<h5>**
	
	有：SDK会根据商户传入的 customerId 去获取已保存的卡列表，并在展示在支付区域。这里分两种场景:
	1.付后存卡：用户在首次支付时，在收集卡信息界面勾选了保存卡选项框，可以通过customerId查询之前保存的卡支付信息，
		并在支付区域展示支付方式列表以供用户选择进行支付。
	2.先存后付：用户点击了 add 添加新卡按钮，SDK展示收集卡信息界面，用户手动输入卡信息，并且选中存卡选项，SDK会创建
		paymentMethod，并调用 confirmPaymentMethod API，通过商户传入的 customerId 将当前客户和卡信息进行绑定，
		方便在之后的场景或延后发起扣款。
	无：SDK展示收集卡信息界面，用户手动输入卡信息，进行一次性支付

> **<h3>5. iOS sdk调用方法介绍<h3>**

> 对接商户准备工作（商户调用sdk准备工作，可参照demo）
	
| 方法类型 | 示例| 
| :------ | :------ |
| 方法原型	       |    - (void)payOrder:(ABPayOrderInfo *)orderInfo fromScheme:(NSString *)schemeStr callback:(CompletionBlock)completionBlock;   |
| 方法功能	       |        提供给商户订单支付功能                                   |
| 方法参数	       |        orderInfo (收集订单信息对象，详细请参考 SDK 的属性描述) schemeStr(暂时无用，传空字符串（@""）即可)  |
| 返回值	          |        支付回调 completionBlock, resultDic支付返回参数 （详见 7）     |
	

 > **<h3>6. ResultCode (sdk返回code码关系表) <h3>**
  
| ResultCode（返回码） | payment result（订单结果） | 
| ------ | ------ |
| 9900            |    Successful purchase  （支付成功）        |
| 7700            |    ProFailure purchase  （支付失败）        |
| 6600            |    Order pending        （交易待处理）      |

- 支付过程中，返回结果中redirectUrl为空，则不需要进行3DS验证，将解析后的交易结果返回给SDK端，SDK端跳转用户到交易结果展示页面。

- 支付过程中，返回结果中redirectUrl不为空，则需要进行3DS验证，将解析后的redirectUrl返回给SDK端，SDK端跳转用户到3DS页面进行验证，
3DS验证完成后，AsiaBill将跳转到商户的returnUrl地址（请参阅 <a href="https://asiabill.gitbook.io/api-explorer/webhook/zhi-fu-jie-guo-tiao-zhuan" target="_blank">支付结果跳转</a> ），商户端验证签名并解析数据后，将解析结果（成功、失败）返回给SDK端，SDK端跳转用户到交易结果展示页面。

> **<h3>6. webhook 通知处理<h3>**

在订单完成后，AsiaBill系统会触发webhook，调用商户交易时给定的callbackUrl，来通知商户交易结果状态，详情请参阅  <a href="https://asiabill.gitbook.io/api-explorer/webhook/gai-shu" target="_blank">webhook</a> 

```
仅接收浏览器端的支付结果是存在风险的，商户网站可能因用户网络或者用户关闭网页导致不能获取到支付结果。建议商户接收 AsiaBill 的支付
结果异步通知，可以通过在收集 ABPayOrderInfo 支付信息步骤中设置 callbackUrl 来指定接收地址。
```
