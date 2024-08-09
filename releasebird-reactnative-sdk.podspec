require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "releasebird-reactnative-sdk"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "", :tag => "#{s.version}" }

  s.source_files = "releasebird-ios-sdk/releasebird-ios-sdk/relesebird-ios-sdk/**/*.{h,m,mm}"

  s.dependency "React-Core"
  s.dependency "releasebird-ios-sdk", "1.0.0"
end