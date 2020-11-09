# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Samples' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Samples
  pod 'NDMVVM/Swift', :path => '.'
  pod "NDLog", :path => '../NDLog'
  pod "NDManualObjects", :path => '../NDManualObjects'
  pod "NDUtils", :path => '../NDUtils'

  target 'SamplesTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'NDMVVM', :path => '.'
  end

  target 'SamplesUITests' do
    # Pods for testing
    pod 'NDMVVM', :path => '.'
  end

end
