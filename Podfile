# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'essentia-bridges-api-ios' do
  use_frameworks!
  
#Core
  pod "HDWalletKit" , :git => 'https://github.com/essentiaone/HDWallet.git', :branch => 'feature/swift-5'
  pod "essentia-network-core-ios", :git => 'https://github.com/essentiaone/essentia-network-core-ios.git', :branch => 'feature/swift-5'
  
  target 'Essentia-bridges-api-ios-tests' do
      inherit! :search_paths
  end
end
