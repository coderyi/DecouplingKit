
Pod::Spec.new do |s|

  s.name         = "DecouplingKit"
  s.version      = "0.0.2"
  s.summary      = "DecouplingKit"
  s.description  = "DecouplingKit"
  s.license      = "MIT"



  s.homepage     = "https://github.com/coderyi/DecouplingKit"


  s.author             = { "coderyi" => "coderyi@foxmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/coderyi/DecouplingKit.git", :tag => "#{s.version}" }

  s.source_files  = "DecouplingKit/**/*.{h,m,mm}"
  s.requires_arc = true
  s.resources = "DecouplingKit/**/*.{png,plist}"


end
