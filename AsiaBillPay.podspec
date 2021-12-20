
Pod::Spec.new do |spec|

  spec.name         = "AsiaBillPay"

  spec.version      = "0.0.1"

  spec.summary      = "AsiaBillPay iOS SDK."

  spec.description  = <<-DESC
			AsiaBillPay Mobile iOS SDK.
                   DESC

  spec.homepage     = "https://github.com/Asiabill/AsiaBillPay_iOS.git"

  spec.license      = { :type => "Apache", :file => "LICENSE" }

  spec.author             = { "dzl" => "dengzhilin@asiabill.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/Asiabill/AsiaBillPay_iOS.git", :tag => "#{spec.version}" }

  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"

  spec.resource  = "AsiaBillPay_SDK/AsiaBillPaySDKResours.bundle"

  spec.ios.vendored_frameworks = 'AsiaBillPay_SDK/AsiaBillPaySDK.framework'

  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.framework  = "SomeFramework"
  spec.frameworks = "UIKit", "Foundation"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end

