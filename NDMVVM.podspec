Pod::Spec.new do |s|
  s.name         = "NDMVVM"
  s.version      = "0.0.1"
  s.summary      = "Support create object by code instead of IB."
  s.description  = <<-DESC
  NDMVVM is a small framework that support create object by code instead of IB.
                   DESC
  s.homepage     = "https://github.com/hiep-nd/nd-mvvm.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Nguyen Duc Hiep" => "hiep.nd@gmail.com" }
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.swift_versions = ['4.0', '5.1', '5.2']
  #s.source        = { :http => 'file:' + URI.escape(__dir__) + '/' }
  s.source       = { :git => "https://github.com/hiep-nd/nd-mvvm.git", :tag => "Pod-#{s.version}" }
  s.source_files  = "NDMVVM/*.{h,m,mm,swift}", "NDMVVM/Privates/**/*.{h,m,mm,swift}"
  #s.public_header_files = "NDMVVM/**/*.h"
  s.private_header_files = "NDMVVM/Privates/**/*.h"
  s.header_mappings_dir = 'NDMVVM'
  s.dependency 'NDLog'
  s.dependency 'NDManualObject'
  
  s.subspec 'Abstracts' do |ss|
    ss.source_files  = "NDMVVM/Abstracts/*.{h,m,mm,swift}"
  end
  s.subspec 'ViewModels' do |ss|
    ss.source_files  = "NDMVVM/ViewModels/*.{h,m,mm,swift}"
  end
  s.subspec 'Views' do |ss|
    ss.source_files  = "NDMVVM/Views/*.{h,m,mm,swift}"
  end
end
