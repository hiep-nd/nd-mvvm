# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
workspace 'NDMVVM'

target 'Samples' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Samples
  pod 'NDAutolayoutUtils'
  pod 'NDModificationOperators'
  pod 'NDMVVM', :path => '.'
  
  pod "NDLog/ObjC", :path => '../NDLog'
  pod "NDManualObjects/ObjC", :path => '../NDManualObjects'
  pod "NDUtils/ObjC", :path => '../NDUtils'

  target 'SamplesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SamplesUITests' do
    # Pods for testing
  end

end
