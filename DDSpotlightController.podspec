#
# Be sure to run `pod lib lint SpotlightController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DDSpotlightController'
  s.version          = '0.0.1'
  s.summary          = 'SpotlightController wraps CoreSpotlight functionality for easy integration'

  s.homepage         = 'https://dashdevs.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dashdevs llc' => 'hello@dashdevs.com' }
  s.source           = { :git => 'https://github.com/dashdevs/DDSpotlightController.git', :tag => s.version }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SpotlightController/Classes/**/*'
  s.frameworks = 'CoreSpotlight'
  
  s.swift_version = '5.0'

end
