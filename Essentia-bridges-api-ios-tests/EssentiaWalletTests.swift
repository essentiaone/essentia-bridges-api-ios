//
//  EssentiaWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Bohdan Sinchuk on 6/11/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

private var url = "https://b3.essentia.network"
private var apiVersion = "/api/v1"
private var serverUrl = url + apiVersion

private var addressFrom: essentia_bridges_api_ios.Address = "DP1BvFnKxTRczynwc8DTWFUK22XQ7pjzWJ"
private var transactionId = "1240eb9af29867dc20b8b9df61e1b7be54b06b16352ae0ab8d31f7d05356b458"
private var expectedBalance = 1000.0

private struct ExpectedTransactionbyId {
    static public let blockhash: String = "5b795feb155a9a0af5e47dc4873b5ecf1bf7e06a8775e515fa7704baa1a5d05b"
    static public let blockheight: Int = 14465
    static public let blocktime: Int = 1557140104
    static public let confirmations: Int = 60
    static public let locktime: Int = 0
    static public let size: Int = 226
    static public let time: Int = 1557140104
    static public let txid: String = "1240eb9af29867dc20b8b9df61e1b7be54b06b16352ae0ab8d31f7d05356b458"
    static public let txlock: Bool = false
    static public let fees: Double = 11.2
    static public let valueOut: Double = 2219988.8
    
    public struct Vin {
        static public let coinbase = "03a5ce0f1a4d696e656420627920416e74506f6f6c35b0001f01204beb20e2540200008b090000"
        static public let sequence: Int = 4294967295
        static public let number: Int = 0
    }
    
    public struct Vout {
        
        public struct ScriptPubKey {
            static public let addresses: [String] = ["DP1BvFnKxTRczynwc8DTWFUK22XQ7pjzWJ"]
            static public let asm = "OP_DUP OP_HASH160 c3f36d42801567254b137c34051c523e94799592 OP_EQUALVERIFY OP_CHECKSIG"
            static public let hex: String = "76a914c3f36d42801567254b137c34051c523e9479959288ac"
        }
       
        static public let spentTxId: String = "37682c3637165c44e479b9ca5cb882ae2b4071b0bf40a722cde34d245792d3f0"
        static public let spentIndex: Int = 1
        static public let spentHeight: Int = -1
        static public let value: String = "112000.00000000"
    }
}

private struct ExpectedTransactionHistory {
    static public let fromNumber: Int = 0
    static public let toNumber: Int = 20
    static public let totalItems: Int = 20
}

private struct ExpectedUTXO {
    static public let address = "DP1BvFnKxTRczynwc8DTWFUK22XQ7pjzWJ"
    static public let amount = 1.0
    static public let satoshis = 100000000
    static public let scriptPubKey = "76a914c3f36d42801567254b137c34051c523e9479959288ac"
    static public let ts = 1557139568
    static public let txid = "89c0d15bb57888310026248c3e7c0811dfa672fd68c67c6fff91e25ffe85c39e"
    static public let vout = 0
    static public let confirmations = 0
}

private var transactionData =
    ["01000000016c0674df8d794f0b3fd8c960b30d3c18427728f73e78b052bd17042",
     "77269a29a000000006a4730440220171fc3b0081f7a6c1673000fb9134e110b57",
     "a15662c6faa58f57122047ba70ba02206b35abe567569689de9883e7c11c51dc9",
     "edc2fccecedc194942dee61e9e7c3201210388c1c8e2bd42c9e40888f2373d69b",
     "0627925da9da8246765857a8f1283d32dddffffffff0210270000000000001976",
     "a914e42a54ba2042e889461c7966ac6ba13eeb144a3f88ac409c0000000000001",
     "976a914e42a54ba2042e889461c7966ac6ba13eeb144a3f88ac00000000"].joined()

private var expectedTxId: String = ""

class EssentiaTests: XCTestCase {
    var essWallet: EssentiaWallet?
    
    override func setUp() {
        essWallet = EssentiaWallet(serverUrl)
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        essWallet?.getBalance(for: addressFrom, result: { (result) in
            switch result {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionById() {
        let expectation = self.expectation(description: "Get transaction by Id")
        essWallet?.getTransactionById(for: transactionId, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object.blockhash, ExpectedTransactionbyId.blockhash)
                XCTAssertEqual(object.blocktime, ExpectedTransactionbyId.blocktime)
                XCTAssertEqual(object.blockheight, ExpectedTransactionbyId.blockheight)
                XCTAssertEqual(object.size, ExpectedTransactionbyId.size)
                XCTAssertEqual(object.time, ExpectedTransactionbyId.time)
                XCTAssertEqual(object.txid, ExpectedTransactionbyId.txid)
                XCTAssertEqual(object.valueOut, ExpectedTransactionbyId.valueOut)
                XCTAssertEqual(object.vin[0].sequence, ExpectedTransactionbyId.Vin.sequence)
                XCTAssertEqual(object.vout[0].scriptPubKey.addresses, ExpectedTransactionbyId.Vout.ScriptPubKey.addresses)
                XCTAssertEqual(object.vout[0].scriptPubKey.asm, ExpectedTransactionbyId.Vout.ScriptPubKey.asm)
                XCTAssertEqual(object.vout[0].scriptPubKey.hex, ExpectedTransactionbyId.Vout.ScriptPubKey.hex)
                XCTAssertEqual(object.vout[0].spentTxId, ExpectedTransactionbyId.Vout.spentTxId)
                XCTAssertEqual(object.vout[0].spentIndex, ExpectedTransactionbyId.Vout.spentIndex)
                XCTAssertEqual(object.vout[0].spentHeight, ExpectedTransactionbyId.Vout.spentHeight)
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
        essWallet?.getTransactionsHistory(for: addressFrom, result: { (result) in
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
        essWallet?.getUtxo(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object[0].address, ExpectedUTXO.address)
                XCTAssertEqual(object[0].amount, ExpectedUTXO.amount)
                XCTAssertEqual(object[0].satoshis, ExpectedUTXO.satoshis)
                XCTAssertEqual(object[0].ts, ExpectedUTXO.ts)
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
        essWallet?.sendTransaction(with: transactionData, result: { (result) in
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
                case .defaultError(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
}

