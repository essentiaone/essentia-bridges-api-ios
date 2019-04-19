[![Build Status](https://travis-ci.com/essentiaone/essentia-bridges-api-ios.svg?branch=develop)](https://travis-ci.com/essentiaone/essentia-bridges-api-ios)
[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/essentia-bridges-api-ios/badge.png)](https://cocoadocs.org/docsets/essentia-bridges-api-ios)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/essentia-bridges-api-ios/badge.svg)](https://cocoadocs.org/docsets/essentia-bridges-api-ios)
[![Badge w/ Licence](https://cocoapod-badges.herokuapp.com/l/essentia-bridges-api-ios/badge.svg)](https://cocoadocs.org/docsets/essentia-bridges-api-ios)

# Essentia Brides API (Swift)
Swift wrapper on [our bridges API](https://github.com/essentiaone/essentia-bridges-api) and other blockchain services.
## Features
### Ethereum
- Get balance
- Send transaction
- Get transaction count
- Call smart contract
- Get gas price
- Get gas estimate
- Get block number
- Get gas speed
- Get transaction by hash
 -Get receipt of transaction
- Get token balance
 -Get transaction history
 -Get ERC20 tokens history
 ### Bitcoin
 - Get balance
 - Send transaction
 - Get transaction history 
 - Get Unspent Transaction Output  
 - Get transaction by id
 ### Litecoin
 - Get balance
 - Send transaction
 - Get transaction history 
 - Get Unspent Transaction Output  
 - Get transaction by id
 ### Bitcoin Cash
 - Get balance
 - Get transaction history 
 - Get transaction by id
 - Send raw transaction
 ### Dash
 - Get balance
 - Get transaction history 
 - Get transaction by id
 - Send raw transaction
## Installation
### CocoaPods
<p>To integrate Bridges API into your Xcode project using <a href="http://cocoapods.org">CocoaPods</a>, specify it in your <code>Podfile</code>:</p>
<pre><code class="ruby language-ruby">pod 'essentia-bridges-api-ios'</code></pre>

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.
## How to use
1. Use instructions from https://github.com/essentiaone/essentia-bridges-api
2. Init crypto wallet
```Swift
let etherScanUrl = "http://api.etherscan.io"
let etherApiKey = "<Get your api key on etherscan.io>"
let serverUrl = "<URL from step 1>"
let etherScanInfo = EtherScanInfo(url: ethterScanUrl, apiKey: etherScanApiKey)
let wallet = CryptoWallet(serverUrl, etherScan: etherScanInfo)
```
or use one wallet directly
```Swift
let bitcoinWallet = BitcoinWallet(serverUrl)
```

3. Use essentia-bridges-api-ios
```Swift
let btcAddress = "1PGEjYqbk8CzmsFdRXQSwfAtZ7ieRWaAtA"
wallet.bitcoin.getBalance(for: btcAddress, result: { (result) in
print(result)
})
```
[Usage examples](https://github.com/essentiaone/essentia-bridges-api-ios/tree/develop/Essentia-bridges-api-ios-tests)

## License
essentia-bridges-api-ios is released under the [MIT License](https://github.com/essentiaone/essentia-bridges-api-ios/blob/develop/LICENSE.md).
