
Pod::Spec.new do |s|

  s.name         = "Bussiness2"
  s.version      = "0.0.1"
  s.summary      = "Bussiness2"
  s.description  = "Bussiness2"



  s.homepage     = "https://github.com/coderyi/Bussiness2"


  s.author             = { "coderyi" => "coderyi@foxmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/coderyi/Bussiness2", :tag => "#{s.version}" }

  s.source_files  = "Bussiness2/**/*.{h,m,mm}"
  s.requires_arc = true
  s.resources = "Bussinesss2/**/*.{png,plist}"


end
