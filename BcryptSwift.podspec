#
#  Be sure to run `pod spec lint BcryptSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "BcryptSwift"
  s.version      = "1.0.4"
  s.summary      = "A standalone Bcrypt algorithm in Swift."
  s.homepage     = "https://github.com/360Learning/BcryptSwift"
  s.license      = "Apache"
  s.author       = { "360Learning" => "dev@360learning.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/360Learning/BcryptSwift.git", :tag => "#{s.version}" }
  s.source_files  = 'BcryptSwift/*.swift'
  s.swift_version = '4.2'

end
