Pod::Spec.new do |s|
  s.name         = "SJKit"
  s.version      = "1.0.0"
  s.summary      = ""
  s.description  = <<-DESC
                   全局配置文件类
                   DESC

  s.homepage     = "https://github.com/chensj1901/SJKit"
  s.license      = "MIT (example)"
  s.author             = { "chensj1901" => "chensj2010@qq.com" }
  s.platform     = :ios, "6.0"
  s.source       = { :git => "https://github.com/chensj1901/SJKit.git", :tag => "1.0.0" }
  s.source_files  = "SJKit/*.{h,m}"
  s.public_header_files = "SJKit/*.h"
  s.requires_arc = false
  s.dependency 'FMDB', '~> 2.5'
end