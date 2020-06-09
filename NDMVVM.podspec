Pod::Spec.new do |s|
  s.name         = "NDMVVM"
  s.version      = "0.0.1"
  s.summary      = "Support MVVM pattern."
  s.description  = <<-DESC
  NDMVVM is a small framework that support MVVM pattern.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-mvvm.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  s.requires_arc   = true
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-mvvm.git", :tag => "Pod-#{s.version}" }
  s.source_files  = "NDMVVM/**/*.{h,m,mm}"
  s.public_header_files = "NDMVVM/NDMVVM.h", "NDMVVM/{Abstracts,ViewModels,Views}/**/*.h"
  s.header_mappings_dir = 'NDMVVM'
  
  s.dependency 'NDLog'
  s.dependency 'NDManualObjects'
end
