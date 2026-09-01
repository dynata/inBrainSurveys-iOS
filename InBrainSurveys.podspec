Pod::Spec.new do |s|

  s.name         = "InBrainSurveys"
  s.version      = "3.0.3"
  s.summary      = "Monetization surveys for apps, powered by inBrain.ai."
  s.description  = "In-App monetization via surveys, powered by inBrain.ai."

  s.homepage     = "https://github.com/inbrainai/inBrainSurveys_SDK"
  s.license      = { :type => "MIT", :file => "License" }
  s.author       = { "inBrain.ai" => "integrations@inbrain.ai" }

  s.platform     = :ios, "12.0"
  s.source       = { :git => "https://github.com/dynata/inBrainSurveys-iOS.git", :tag => s.version }
  s.source_files = "InBrainSurveys.xcframework/*/*.framework/Headers/*.h"

  s.vendored_frameworks = "InBrainSurveys.xcframework"
  s.ios.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration', 'WebKit'

  s.static_framework = true

end


