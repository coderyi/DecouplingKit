
Pod::Spec.new do |s|

  s.name         = "Bussiness1"
  s.version      = "0.0.1"
  s.summary      = "Bussiness1"
  s.description  = "Bussiness1"



  s.homepage     = "https://github.com/coderyi/Bussiness1"


  s.author             = { "coderyi" => "coderyi@foxmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/coderyi/Bussiness1", :tag => "#{s.version}" }

  s.source_files  = "Bussiness1/**/*.{h,m,mm}"
  s.requires_arc = true
  s.resources = "Bussiness1/**/*.{png,plist}"


end
