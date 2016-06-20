#
# Be sure to run `pod lib lint TRPaginator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TRPaginator'
  s.version          = '0.0.6'
  s.summary          = 'TRPaginator helps make pagination easy.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TRPaginator helps make pagination easy. Objective-C class for pagination.
                       DESC

  s.homepage         = 'https://github.com/iostrek/TRPaginator'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iOSTrek' => 'getiostrek@gmail.com' }
  s.source           = { :git => 'https://github.com/iostrek/TRPaginator.git', :branch => "master", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iostrek'

  s.ios.deployment_target = '8.0'

  s.source_files = 'TRPaginator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TRPaginator' => ['TRPaginator/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
