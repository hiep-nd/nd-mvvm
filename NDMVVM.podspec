Pod::Spec.new do |s|
  s.name         = "NDMVVM"
  s.version      = "0.0.4"
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
    ss.source_files = "Sources/Abstracts/*.{h,m,mm,swift}", "Sources/Abstracts/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/Abstracts/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Core'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDUtils/objc', '~> 0.0.5'
  end

  s.subspec 'Abstracts_Swift' do |ss|
    ss.source_files = "Sources/Abstracts_Swift/*.{h,m,mm,swift}"
    ss.dependency 'NDMVVM/Abstracts'
  end

  s.subspec 'ViewModels' do |ss|
    ss.source_files = "Sources/ViewModels/*.{h,m,mm,swift}", "Sources/ViewModels/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/ViewModels/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDUtils/objc', '~> 0.0.5'
  end

  s.subspec 'Views' do |ss|
    ss.source_files = "Sources/Views/*.{h,m,mm,swift}"
    ss.framework = 'Foundation', 'UIKit'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDManualObjects/ObjC', '~> 0.0.8'
    ss.dependency 'NDUtils/objc', '~> 0.0.5'
  end

  s.subspec 'ObjC' do |ss|
    ss.dependency 'NDMVVM/Core'
    ss.dependency 'NDMVVM/Abstracts'
    ss.dependency 'NDMVVM/ViewModels'
    ss.dependency 'NDMVVM/Views'
  end

  s.subspec 'Swift' do |ss|
    ss.dependency 'NDMVVM/Abstracts_Swift'
    ss.dependency 'NDMVVM/ObjC'
  end

  s.default_subspec = 'Swift'
end
