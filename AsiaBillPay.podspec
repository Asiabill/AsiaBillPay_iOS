
Pod::Spec.new do |spec|
  spec.name         = "AsiaBillPay"
  spec.version      = "0.0.1"
  spec.summary      = "AsiaBillPay iOS SDK"
  spec.homepage     = "http://EXAMPLE/AsiaBillPay"
  spec.license      = "MIT"
  spec.author             = "Asiabill"
  spec.authors            = { "Asiabill" => "tech@asiabill.com" }
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/Asiabill/AsiaBillPay_iOS.git", :tag => spec.version }
  spec.source_files  = "AsiaBillPay_SDK"
  spec.resources = "AsiaBillPaySDKDemo/AsiaBillPaySDKDemo/AsiaBillPay_SDK/AsiaBillPaySDKResours.bundle"
  spec.vendored_frameworks = "AsiaBillPaySDKDemo/AsiaBillPaySDKDemo/AsiaBillPay_SDK/AsiaBillPaySDK.framework"
  spec.requires_arc = true
end
