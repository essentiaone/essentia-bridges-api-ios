//
//  LitecoinWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Binomial on 22.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

fileprivate var url = "https://b3.essentia.network"
fileprivate var apiVersion = "/api/v1"
fileprivate var serverUrl = url + apiVersion

fileprivate var addressFrom: Address = "LTNJvXUJeRi41DJuEg5V3zWRhUisC3KUtF"
fileprivate var transactionId = "4747007d8d017c6b37aea2a2b0a2bbdeaeff2f0b9ebeb3cc34d4ba260c0af4d9"
fileprivate var expectedBalance = 0.00579998

fileprivate struct ExpectedTransactionbyId {
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

fileprivate struct ExpectedTransactionHistory {
    static public let from: Int = 0
    static public let to:Int = 50
    static public let totalItems:Int = 52
}

fileprivate struct ExpectedUTXO {
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
                XCTAssertEqual(object.balance.value, expectedBalance)
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
                XCTAssertEqual(object.blockhash, ExpectedTransactionbyId.blockhash)
                XCTAssertEqual(object.blocktime, ExpectedTransactionbyId.blocktime)
                XCTAssertEqual(object.blockheight, ExpectedTransactionbyId.blockheight)
                XCTAssertEqual(object.size, ExpectedTransactionbyId.size)
                XCTAssertEqual(object.time, ExpectedTransactionbyId.time)
                XCTAssertEqual(object.txid, ExpectedTransactionbyId.txid)
                XCTAssertEqual(object.fees, ExpectedTransactionbyId.fees)
                XCTAssertEqual(object.valueIn, ExpectedTransactionbyId.valueIn)
                XCTAssertEqual(object.valueOut, ExpectedTransactionbyId.valueOut)
                XCTAssertEqual(object.vin[0].addr, ExpectedTransactionbyId.Vin.addr)
                XCTAssertEqual(object.vin[0].txid, ExpectedTransactionbyId.Vin.txid)
                XCTAssertEqual(object.vin[0].value, ExpectedTransactionbyId.Vin.value)
                XCTAssertEqual(object.vout[0].scriptPubKey.addresses, ExpectedTransactionbyId.Vout.addresses)
                XCTAssertEqual(object.vout[0].value, ExpectedTransactionbyId.Vout.value)
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
                XCTAssertEqual(object.totalItems, ExpectedTransactionHistory.totalItems)
                XCTAssertEqual(object.from, ExpectedTransactionHistory.from)
                XCTAssertEqual(object.to, ExpectedTransactionHistory.to)
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
                XCTAssertEqual(object[0].address, ExpectedUTXO.address)
                XCTAssertEqual(object[0].amount, ExpectedUTXO.amount)
                XCTAssertEqual(object[0].height, ExpectedUTXO.height)
                XCTAssertEqual(object[0].satoshis, ExpectedUTXO.satoshis)
                XCTAssertEqual(object[0].txid, ExpectedUTXO.txid)
                XCTAssertEqual(object[0].scriptPubKey, ExpectedUTXO.scriptPubKey)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
  
}
