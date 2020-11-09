Pod::Spec.new do |s|
  s.name         = "NDMVVM"
  s.version      = "0.0.3.2"
  s.summary      = "Support MVVM pattern."
  s.description  = <<-DESC
  NDMVVM is a small framework that support MVVM pattern.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-mvvm.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
#  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-mvvm.git", :tag => "Pod-#{s.version}" }

  s.subspec 'Core' do |ss|
    ss.source_files = "Sources/Core/*.{h,m,mm,swift}"
  end

  s.subspec 'Abstracts' do |ss|
    ss.source_files = "Sources/Abstracts/*.{h,m,mm,swift}"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Core'
    ss.dependency 'NDUtils/objc', '~> 0.0.4'
  end

  s.subspec 'Privates' do |ss|
    ss.source_files = "Sources/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDUtils/objc', '~> 0.0.4'
  end

  s.subspec 'ViewModels' do |ss|
    ss.source_files = "Sources/ViewModels/*.{h,m,mm,swift}"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDMVVM/Privates'
    ss.dependency 'NDMVVM/ViewModels_Privates'
    ss.dependency 'NDLog', '~> 0.0.5'
    ss.dependency 'NDUtils/objc', '~> 0.0.4'
  end

  s.subspec 'ViewModels_Privates' do |ss|
    ss.source_files = "Sources/ViewModels/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/ViewModels/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDLog', '~> 0.0.5'
  end

  s.subspec 'Views' do |ss|
    ss.source_files = "Sources/Views/*.{h,m,mm,swift}"
    ss.framework = 'Foundation', 'UIKit'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDMVVM/Privates'
    ss.dependency 'NDLog', '~> 0.0.5'
    ss.dependency 'NDManualObjects', '~> 0.0.7'
    ss.dependency 'NDUtils/objc', '~> 0.0.4'
  end
end
