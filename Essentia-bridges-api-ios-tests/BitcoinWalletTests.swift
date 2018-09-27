//
//  BitcoinWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Binomial on 25.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

private var url = "https://b3.essentia.network"
private var apiVersion = "/api/v1"
private var serverUrl = url + apiVersion

private var addressFrom: Address = "1MoRmwmoA1cFSuePCGJV6UWLTmcxaBBKfW"
private var transactionId = "b7b707244f0b56a49ea9339b6a70c589f24bdacbb20d850f55e3bb855f386c87"
private var transactionData =
["02000000014fe69799ba112fbe7210bb46a24abdb2b4c7aae12db4e2b0c7fe88996734fbe0",
 "010000006b483045022100e9753329e4a51d72b8ae5971b70646100d0e8b8e9655b5980347",
 "217d5ec008d702203fdcadec793b227baf976706d08b68de358650ba2a7368a7f55e193f13",
 "5f28b8012102c0e4768ae9a4f4fbdb42f438695033abc61a8c1f77573ff7273f5b461d264f",
 "00ffffffff0210270000000000001976a9146e81f8092d4b5b5a20d7257d042b0b170b5056",
 "cc88ac103a0100000000001976a9143936070b1eded9950affc4444953c2bb1e5abce388ac00000000"].joined()

private var expectedTxId: String =  "7de75f5864009e04f0cccbc675148c85b6e13e97d2347d384299680ba3533dc9"
private var expectedBalance = 0.00542246

private struct ExpectedTransactionbyId {
    static public let blockhash: String = "0000000000000000001a71f184d147b59a3ef170e094a9c2c435faffa6ce2262"
    static public let blockheight: Int = 518607
    static public let blocktime: Int = 1523964387
    static public let confirmations: Int = 24376
    static public let fees: Double = 0.0005
    static public let size: Int = 225
    static public let time: Int = 1523964387
    static public let txid: String = "b7b707244f0b56a49ea9339b6a70c589f24bdacbb20d850f55e3bb855f386c87"
    static public let valueIn: Double = 0.00714
    static public let valueOut: Double = 0.00664
    
    public struct Vin {
        static public let addr: String = "1MoRmwmoA1cFSuePCGJV6UWLTmcxaBBKfW"
        static public let txid: String = "e54c10f1749ba2cc73e8f4cd07e64565846e3ebe90032e5bbd1870f1cfb3a8a8"
        static public let value: Double = 0.00714
    }
    public struct Vout {
        static public let addresses: [String] = ["1PGEjYqbk8CzmsFdRXQSwfAtZ7ieRWaAtA"]
        static public let txid: String? = nil
        static public let value: String = "0.00010000"
    }
}

private struct ExpectedTransactionHistory {
    static public let fromNumber: Int = 0
    static public let toNumber: Int = 15
    static public let totalItems: Int = 15
}

private struct ExpectedUTXO {
    static public let address = "1MoRmwmoA1cFSuePCGJV6UWLTmcxaBBKfW"
    static public let amount = 0.00014407
    static public let height = 539189
    static public let satoshis = 14407
    static public let scriptPubKey = "76a914e42a54ba2042e889461c7966ac6ba13eeb144a3f88ac"
    static public let txid = "2b070a6e6697c38a5896f6b05cf64bd456e9b92a3dd620da1d3fa455e9814974"
    static public let vout = 0
}

class BitcoinTests: XCTestCase {
    var btcWallet: BitcoinWallet?
    
    override func setUp() {
        btcWallet = BitcoinWallet(serverUrl)
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        btcWallet?.getBalance(for: addressFrom, result: { (result) in
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
        btcWallet?.getTransactionById(for: transactionId, result: { (result) in
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
                XCTAssertEqual(object.vout[0].spentTxId, ExpectedTransactionbyId.Vout.txid)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionsHistory() {
        let expectation = self.expectation(description: "Get transactions history")
        btcWallet?.getTransactionsHistory(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object.totalItems, ExpectedTransactionHistory.totalItems)
                XCTAssertEqual(object.fromNumber, ExpectedTransactionHistory.fromNumber)
                XCTAssertEqual(object.toNumber, ExpectedTransactionHistory.toNumber)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetUTXO() {
        let expectation = self.expectation(description: "Get UTXO")
        btcWallet?.getUTxo(for: addressFrom, result: { (result) in
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
    
    func testSendTX() {
        let expectation = self.expectation(description: "Send TX")
        btcWallet?.sendTransaction(with: transactionData, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object.txid, expectedTxId)
                expectation.fulfill()
            case .failure(let error):
                switch error {
                case .error(let localizedErr):
                    XCTAssert(localizedErr.error != "")
                    expectation.fulfill()
                case .unknownError:
                XCTFail(expectation.description)
            }
        }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
}
