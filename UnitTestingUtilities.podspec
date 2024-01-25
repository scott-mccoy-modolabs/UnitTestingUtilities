#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "UnitTestingUtilities"
  s.version      = "1.0.0"
  s.summary      = "Common code for iOS Unit Testing"

  s.homepage     = "https://github.com/scott-mccoy-modolabs/UnitTestingUtilities.git"


  s.author       = {
    "Scott McCoy" => "scott.mccoy@modolabs.com",
  }
  s.license      = "Modo Labs"

  s.platform     = :ios, '13.0'
  s.source       = { git: "https://github.com/scott-mccoy-modolabs/UnitTestingUtilities.git", tag: s.version }

  s.source_files = "Code/**/*{swift,jpeg}"
  
  s.frameworks = 'XCTest'
  
end
