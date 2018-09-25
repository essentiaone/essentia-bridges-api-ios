//
//  EthereumWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Pavlo Boiko on 04.09.18.
//  Copyright © 2018 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

fileprivate var url = "https://b3.essentia.network"
fileprivate var apiVersion = "/api/v1"
fileprivate var serverUrl = url + apiVersion
fileprivate var ethterScanUrl = "http://api.etherscan.io/api"

fileprivate var address = "0x34205555576717bBdF8158E2b2c9ed64EB1e6B85"
fileprivate var destinationAddrss = "0xA705b88Ef92101f67AF73bf053D0282dbC07d348"
fileprivate var smartContractAddress = ""
fileprivate var transactionHash = "0x4ea4b2cfb8b47d05315983381a8abe0f343b9a8bfcbe65d4c1087669352fb7e4"
fileprivate var etherScanApiKey = "IH2B5YWPTT3B19KMFYIFPMD85SQ7A12BDU"

fileprivate var etherPrivateKey = "c58a1dd38fd56f74b9e175856e6daebcbc778ec37eb3df3bac3c288fc0cffad9"
fileprivate var etherAddress = "0x34205555576717bBdF8158E2b2c9ed64EB1e6B85"

class EthereumTests: XCTestCase {
    var ethWallet: EthereumWallet?
    
    override func setUp() {
        ethWallet = EthereumWallet(serverUrl, etherScan: EtherScanInfo(url: ethterScanUrl, apiKey: etherScanApiKey))
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        ethWallet?.getBalance(for: etherAddress, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.balance.value >= 0)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetGasPrice() {
        let expectation = self.expectation(description: "Get gas price")
        ethWallet?.getGasPrice(result: { (result) in
            switch result {
            case .success(let object):

                XCTAssert(object.value > 0)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionCount() {
        let expectation = self.expectation(description: "Get transaction count")
        ethWallet?.getTransactionCount(for: address, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.count >= 0)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetBlockNumber() {
        let expectation = self.expectation(description: "Get transaction count")
        ethWallet?.getBlockNumber(result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.value != 0)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testSendTransaction() {
        let expectation = self.expectation(description: "Send transaction")
        let transaction = EthereumRawTransaction(value: 0x1,
                                                 to: destinationAddrss,
                                                 gasPrice: 0x09184e72a000,
                                                 gasLimit: 0x2710,
                                                 nonce: 0x00)
        let signer = EIP155Signer(chainId: 1)
        guard let signed = try? signer.sign(transaction, privateKey: Data(hex: etherPrivateKey)) else {
            fatalError()
        }
        ethWallet?.sendTransaction(with: signed.toHexString().addHexPrefix(), result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object != "")
                expectation.fulfill()
            case .failure(let error):
                switch error {
                    case .error(let localizedError):
                        XCTAssertEqual(localizedError.error, "insufficient funds for gas * price + value")
                        expectation.fulfill()
                case .unknownError:
                    XCTFail(expectation.description)
                }
    
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }

}
