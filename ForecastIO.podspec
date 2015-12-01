Pod::Spec.new do |s|

  # 1
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.name = "ForecastIO"
  s.summary = "Swift framework for forecast.io"
  s.requires_arc = true

  # 2
  s.version = "0.12.10"

  # 3
  s.license = { :type => "MIT", :file => "LICENSE" }

  # 4
  s.author = { "Alex Zhao" => "simplyzhao@gmail.com" }

  # 5
  s.homepage = "https://github.com/simplyzhao/ForecastIO"

  # 6
  s.source = { :git => "https://github.com/simplyzhao/ForecastIO.git", :tag => "#{s.version}"}

  # 7
  s.framework = "UIKit"

  # 8
  s.source_files = "ForecastIO/**/*.{swift}"
end
