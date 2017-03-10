
Pod::Spec.new do |s|

  s.name         = "BussinessPublicService"
  s.version      = "0.0.1"
  s.summary      = "BussinessPublicService"
  s.description  = "BussinessPublicService"



  s.homepage     = "https://github.com/coderyi/BussinessPublicService"


  s.author             = { "coderyi" => "coderyi@foxmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/coderyi/BussinessPublicService", :tag => "#{s.version}" }

  s.source_files  = "BussinessPublicService/**/*.{h,m,mm}"
  s.requires_arc = true
  s.resources = "BussinessPublicService/**/*.{png,plist}"


end
