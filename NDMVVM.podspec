Pod::Spec.new do |s|
  s.name         = "NDMVVM"
  s.version      = "0.0.4.2"
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

  s.subspec 'Core_ObjC' do |ss|
    ss.source_files = "Sources/Core_ObjC/*.{h,m,mm,swift}"
  end

  s.subspec 'Core_Swift' do |ss|
    ss.dependency 'NDMVVM/Core_ObjC'
  end

  s.subspec 'Core' do |ss|
    ss.dependency 'NDMVVM/Core_Swift'
  end

  s.subspec 'Abstracts_ObjC' do |ss|
    ss.source_files = "Sources/Abstracts_ObjC/*.{h,m,mm,swift}", "Sources/Abstracts_ObjC/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/Abstracts_ObjC/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Core_ObjC'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDUtils/objc_ObjC', '~> 0.0.5'
  end

  s.subspec 'Abstracts_Swift' do |ss|
    ss.source_files = "Sources/Abstracts_Swift/*.{h,m,mm,swift}"
    ss.dependency 'NDMVVM/Abstracts_ObjC'
  end

  s.subspec 'Abstracts' do |ss|
    ss.dependency 'NDMVVM/Abstracts_Swift'
  end

  s.subspec 'ViewModels_ObjC' do |ss|
    ss.source_files = "Sources/ViewModels_ObjC/*.{h,m,mm,swift}", "Sources/ViewModels_ObjC/Privates/*.{h,m,mm,swift}"
    ss.private_header_files = "Sources/ViewModels_ObjC/Privates/*.h"
    ss.framework = 'Foundation'
    ss.dependency 'NDMVVM/Abstracts_ObjC'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDUtils/objc_ObjC', '~> 0.0.5'
  end

  s.subspec 'ViewModels_Swift' do |ss|
    ss.dependency 'NDMVVM/ViewModels_ObjC'
  end

  s.subspec 'ViewModels' do |ss|
    ss.dependency 'NDMVVM/ViewModels_Swift'
  end

  s.subspec 'Views_ObjC' do |ss|
    ss.source_files = "Sources/Views_ObjC/*.{h,m,mm,swift}"
    ss.framework = 'Foundation', 'UIKit'
    ss.dependency 'NDMVVM/Abstracts_ObjC'
    ss.dependency 'NDLog/ObjC', '~> 0.0.6'
    ss.dependency 'NDManualObjects/ObjC', '~> 0.0.8.3'
    ss.dependency 'NDUtils/UIKit_ObjC', '~> 0.0.5'
    ss.dependency 'NDAutolayoutUtils/ObjC', '~> 0.0.7'
  end

  s.subspec 'Views_Swift' do |ss|
    ss.source_files = "Sources/Views_Swift/*.{h,m,mm,swift}"
    ss.dependency 'NDMVVM/Views_ObjC'
    ss.dependency 'NDUtils/UIKit_Swift', '~> 0.0.5'
  end

  s.subspec 'Views' do |ss|
    ss.dependency 'NDMVVM/Views_Swift'
  end

  s.subspec 'ObjC' do |ss|
    ss.dependency 'NDMVVM/Core_ObjC'
    ss.dependency 'NDMVVM/Abstracts_ObjC'
    ss.dependency 'NDMVVM/ViewModels_ObjC'
    ss.dependency 'NDMVVM/Views_ObjC'
  end

  s.subspec 'Swift' do |ss|
    ss.dependency 'NDMVVM/Core_Swift'
    ss.dependency 'NDMVVM/Abstracts_Swift'
    ss.dependency 'NDMVVM/ViewModels_Swift'
    ss.dependency 'NDMVVM/Views_Swift'
  end

  s.default_subspec = 'Swift'
end
