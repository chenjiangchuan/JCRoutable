#
# Be sure to run `pod lib lint JCRoutable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JCRoutable'
  s.version          = '0.1.9'
  s.summary          = 'Development based Routable.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/chenjiangchuan/JCRoutable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenjiangchuan' => 'jiangchuanc@gmail.com' }
  s.source           = { :git => 'https://github.com/chenjiangchuan/JCRoutable.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'JCRoutable'
end
