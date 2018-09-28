Pod::Spec.new do |s|
  s.name             = 'essentia-bridges-api-ios'
  s.version          = '0.0.8'
  s.summary          = 'Bridges api for crypto wallets'

  s.homepage         = 'https://github.com/essentiaone/essentia-bridges-api-ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author           = { 'impl' => 'pavlo.bojkoo@gmail.com' }
  s.source           = { :git => 'https://github.com/essentiaone/essentia-bridges-api-ios.git', :tag => s.version.to_s }
  
  s.swift_version= '4.2'
  s.static_framework  = true
  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.module_name   = "EssentiaBridgesApi"
  s.source_files = 'essentia-bridges-api-ios/**/*.{swift}'

  s.dependency 'essentia-network-core-ios'
end
