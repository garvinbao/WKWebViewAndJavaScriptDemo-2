Pod::Spec.new do |s|
  s.name         = "WKWebViewAndJavaScriptDemo-2"
  s.version      = "1.0.0"
  s.summary      = "WKWebViewAndJavaScriptDemo-2是OC交互远程JS的演示"
  s.homepage     = "https://github.com/garvinbao/WKWebViewAndJavaScriptDemo-2.git"
  s.license      = "MIT"
  s.author             = { "garvinbao" => "garvinemail@163.com" }
  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/garvinbao/WKWebViewAndJavaScriptDemo-2.git", :tag => "#{s.version}" }
  s.source_files  = "WKWebViewAndJavaScriptDemo-2/*"
  s.exclude_files = "WKWebViewAndJavaScriptDemo-2/Exclude"
  s.framework  = "UIKit"
  s.requires_arc = true
end
