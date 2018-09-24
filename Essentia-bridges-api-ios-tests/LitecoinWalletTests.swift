//
//  LitecoinWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import Foundation
import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

fileprivate var url = "https://b3.essentia.network"
fileprivate var apiVersion = "/api/v1"
fileprivate var serverUrl = url + apiVersion

fileprivate var addressFrom: Address = "LTNJvXUJeRi41DJuEg5V3zWRhUisC3KUtF"
fileprivate var transactionId = "4747007d8d017c6b37aea2a2b0a2bbdeaeff2f0b9ebeb3cc34d4ba260c0af4d9"
fileprivate var expectedBalance = 0.00579998

fileprivate struct expectedTransactionbyId {
    static public let blockhash: String = "021af84732c7f1ff56f817ec8ca18ae70e66c406959dfee13fa1d7da97a55dce"
    static public let blockheight: Int = 1418413
    static public let blocktime: Int = 1525873384
    static public let fees: Double = 0.005
    static public let size: Int = 225
    static public let time: Int = 1525873384
    static public let txid: String = "4747007d8d017c6b37aea2a2b0a2bbdeaeff2f0b9ebeb3cc34d4ba260c0af4d9"
    static public let valueIn: Double = 0.158
    static public let valueOut: Double = 0.153
    
    public struct Vin {
        static public let addr: String = "LTNJvXUJeRi41DJuEg5V3zWRhUisC3KUtF"
        static public let txid: String = "bc01877d38f684bbedbc30b79e9faa459c70cca869d58dd6a8408950f373829f"
        static public let value: Double = 0.158
    }
    
    public struct Vout {
        static public let addresses: [String] = ["LKeZuJLTNa6muUVDe59xrn7ZnTkmiS8iPg"]
        static public let txid: String = "1f62d0e1e8ee1fd1e6e324c2624ba4c4adb7116c9754edf7c3eb3e47624807aa"
        static public let value: String = "0.01000000"
    }
}

fileprivate struct expectedTransactionHistory {
    static public let from: Int = 0
    static public let to:Int = 50
    static public let totalItems:Int = 52
}

fileprivate struct expectedUTXO {
    static public let address = "LTNJvXUJeRi41DJuEg5V3zWRhUisC3KUtF"
    static public let amount = 0.00379998
    static public let height = 1487761
    static public let satoshis = 379998
    static public let scriptPubKey = "76a9145955949e5acb12cba1cb7582c7b98eba6cdbf24b88ac"
    static public let txid = "93c91eb170b04316ec5f34e071529eae5e6d196efda8a20272af7868b0327fa6"
    static public let vout = 1
}

class LitecoinTests: XCTestCase {
    var ltcWallet: LitecoinWallet?
    
    override func setUp() {
        ltcWallet = LitecoinWallet(serverUrl)
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        ltcWallet?.getBalance(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.balance.value == expectedBalance)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionById() {
        let expectation = self.expectation(description: "Get transaction by Id")
        ltcWallet?.getTransactionById(for: transactionId, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.blockhash == expectedTransactionbyId.blockhash)
                XCTAssert(object.blocktime == expectedTransactionbyId.blocktime)
                XCTAssert(object.blockheight == expectedTransactionbyId.blockheight)
                XCTAssert(object.size == expectedTransactionbyId.size)
                XCTAssert(object.time == expectedTransactionbyId.time)
                XCTAssert(object.txid == expectedTransactionbyId.txid)
                XCTAssert(object.fees == expectedTransactionbyId.fees)
                XCTAssert(object.valueIn == expectedTransactionbyId.valueIn)
                XCTAssert(object.valueOut == expectedTransactionbyId.valueOut)
                XCTAssert(object.vin[0].addr == expectedTransactionbyId.Vin.addr)
                XCTAssert(object.vin[0].txid == expectedTransactionbyId.Vin.txid)
                XCTAssert(object.vin[0].value == expectedTransactionbyId.Vin.value)
                XCTAssert(object.vout[0].scriptPubKey.addresses == expectedTransactionbyId.Vout.addresses)
                XCTAssert(object.vout[0].value == expectedTransactionbyId.Vout.value)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionsHistory() {
        let expectation = self.expectation(description: "Get transactions history")
        ltcWallet?.getTransactionsHistory(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object.totalItems == expectedTransactionHistory.totalItems)
                XCTAssert(object.from == expectedTransactionHistory.from)
                XCTAssert(object.to == expectedTransactionHistory.to)
                expectation.fulfill()
            case .failure:
                 XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetUTXO() {
        let expectation = self.expectation(description: "Get UTXO")
        ltcWallet?.getUTxo(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object[0].address == expectedUTXO.address)
                XCTAssert(object[0].amount == expectedUTXO.amount)
                XCTAssert(object[0].height == expectedUTXO.height)
                XCTAssert(object[0].satoshis == expectedUTXO.satoshis)
                XCTAssert(object[0].txid == expectedUTXO.txid)
                XCTAssert(object[0].scriptPubKey == expectedUTXO.scriptPubKey)                
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
  
}
