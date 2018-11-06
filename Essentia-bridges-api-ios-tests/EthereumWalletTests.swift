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
fileprivate var ethterScanUrl = "http://api.etherscan.io"

fileprivate var address = "0x3264d85ca1d3a7725bc9d2a800deeabc6519a447"
fileprivate var destinationAddrss = "0x2f5059f64D5C0c4895092D26CDDacC58751e0C3C"
fileprivate var transactionData = "0x338b5dea0000000000000000000000008f0921f30555624143d427b340b1156" +
                "914882c1000000000000000000000000000000000000000000000000000005af3107a4000"
fileprivate var smartContractAddress = ""
fileprivate var transactionHash = "0x4ea4b2cfb8b47d05315983381a8abe0f343b9a8bfcbe65d4c1087669352fb7e4"
fileprivate var etherScanApiKey = "IH2B5YWPTT3B19KMFYIFPMD85SQ7A12BDU"

class EthereumTests: XCTestCase {
    var ethWallet: EthereumWallet?
    
    override func setUp() {
        ethWallet = EthereumWallet(serverUrl, etherScan: EtherScanInfo(url: ethterScanUrl, apiKey: etherScanApiKey))
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        ethWallet?.getBalance(for: address, result: { (result) in
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
    
    func testGetEstimate() {
        let expectation = self.expectation(description: "Get gas estimate")
        ethWallet?.getGasEstimate(from: address, to: destinationAddrss, data: "0x", result: { (result) in
            expectation.fulfill()
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
}
