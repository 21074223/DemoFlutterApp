#
# Be sure to run `pod lib lint FlutterAppDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlutterAppDemo'
  s.version          = '0.1.0'
  s.summary          = 'Flutter 产物集成测试'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Flutter 产物集成测试，Flutter 产物集成测试
                       DESC

  s.homepage         = 'https://github.com/21074223/DemoFlutterApp'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LeoLai' => '21074223@qq.com' }
  s.source           = { :git => 'https://github.com/21074223/DemoFlutterApp.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0' 

  s.source_files = 'FlutterAppDemo/Classes/**/*'
  
  s.vendored_frameworks = 'App.framework'
  s.pod_target_xcconfig = { 'VALID_ARCHS[sdk=iphonesimulator*]' => ''}
   
  s.subspec 'flutter_boost' do |boost|
  boost.source_files = 'flutter_boost/Classes/**/*.{h,m,mm}'
       
  boost.public_header_files =
      'flutter_boost/Classes/Boost/FlutterBoostPlugin.h',
      'flutter_boost/Classes/Boost/FLBPlatform.h',
      'flutter_boost/Classes/Boost/FLBFlutterContainer.h',
      'flutter_boost/Classes/Boost/FLBFlutterAppDelegate.h',
      'flutter_boost/Classes/Boost/FLBTypes.h',
      'flutter_boost/Classes/Boost/FlutterBoost.h',
      'flutter_boost/Classes/Boost/BoostChannel.h',
      'flutter_boost/Classes/container/FLBFlutterViewContainer.h'

       boost.libraries = 'c++'
       boost.xcconfig = {
           'CLANG_CXX_LANGUAGE_STANDARD' => 'c++11',
           'CLANG_CXX_LIBRARY' => 'libc++'
       }
       
       boost.subspec 'FlutterSDK' do |fluttersdk|
         fluttersdk.vendored_frameworks = 'Flutter/Flutter.framework'
       end
   end
end
