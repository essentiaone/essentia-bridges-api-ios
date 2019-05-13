//
//  DashWalletTest.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Bohdan Sinchuk on 4/17/19.
//  Copyright © 2019 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

private var url = "https://b3.essentia.network"
private var apiVersion = "/api/v1"
private var serverUrl = url + apiVersion

private var addressFrom: essentia_bridges_api_ios.Address = "Xkii6qKmiqC229oggR2RHrw9c7U5C3CCTx"
private var transactionId = "91ded3864795f17d944ffa52b95609996272f124718a53e650d1f7a8699f89a6"
private var expectedBalance = 1000.0

private struct ExpectedTransactionbyId {
    static public let blockhash: String = "0000000000000016ea61049fb47089118edeaaf3b1962c4e6cc00ab427ee2d27"
    static public let blockheight: Int = 1035941
    static public let blocktime: Int = 1552471618
    
    public struct CbTx {
        static public let version: Int = 3
        static public let height: Int = 1035941
        static public let merkleRootMNList: String = "77531c8c1c13e2a02fa6dbb84281ab1282631becba9985ef5d7b9479f095dbcb"
    }
    
    static public let confirmations: Int = 8
    static public let extraPayload = "0100a5ce0f00cbdb95f079947b5def8599baec1b638212ab8142b8dba62fa0e2131c8c1c5377"
    static public let extraPayloadSize: Int = 38
    static public let isCoinBase: Bool = true
    static public let locktime: Int = 0
    static public let size: Int = 197
    static public let time: Int = 1552471618
    static public let txid: String = "91ded3864795f17d944ffa52b95609996272f124718a53e650d1f7a8699f89a6"
    static public let txlock: Bool = false
    static public let type: Int = 5
    static public let valueOut: Double = 3.34571244
    
    public struct Vin {
        static public let coinbase = "03a5ce0f1a4d696e656420627920416e74506f6f6c35b0001f01204beb20e2540200008b090000"
        static public let sequence: Int = 4294967295
        static public let number: Int = 0
    }
    
    public struct Vout {
        static public let addresses: [String] = ["Xkii6qKmiqC229oggR2RHrw9c7U5C3CCTx"]
        static public let asm = "OP_DUP OP_HASH160 6e0ba2ccdc601f1b0af728917bdb6cedb1733c59 OP_EQUALVERIFY OP_CHECKSIG"
        static public let hex: String = "76a9146e0ba2ccdc601f1b0af728917bdb6cedb1733c5988ac"
        static public let value: String = "1.67285620"
        static public let spentTxId: String = "ba3e6663d7e55deec916771b7ceb8dcf128eb671f68048027d3368d05df14051"
        static public let spentIndex: Int = 2
        static public let spentHeight: Int = 1045405
    }
}

private struct ExpectedTransactionHistory {
    static public let fromNumber: Int = 0
    static public let toNumber: Int = 44
    static public let totalItems: Int = 44
}

private struct ExpectedUTXO {
    static public let address = "Xkii6qKmiqC229oggR2RHrw9c7U5C3CCTx"
    static public let amount = 1000.0
    static public let height = 903400
    static public let satoshis = 100000000000
    static public let scriptPubKey = "76a9146e0ba2ccdc601f1b0af728917bdb6cedb1733c5988ac"
    static public let txid = "5eb2ce4f6c8ddf0c84a54826cce9207072d1b422fe1e32cddf591c7cc74a1750"
    static public let vout = 1
    static public let confirmations = 152329
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

class DashTests: XCTestCase {
    var dshWallet: DashWallet?
    
    override func setUp() {
        dshWallet = DashWallet(serverUrl)
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        dshWallet?.getBalance(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssert(object >= 0)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionById() {
        let expectation = self.expectation(description: "Get transaction by Id")
        dshWallet?.getTransactionById(for: transactionId, result: { (result) in
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
                XCTAssertEqual(object.vout[0].scriptPubKey.addresses, ExpectedTransactionbyId.Vout.addresses)
                XCTAssertEqual(object.vout[0].scriptPubKey.asm, ExpectedTransactionbyId.Vout.asm)
                XCTAssertEqual(object.vout[0].scriptPubKey.hex, ExpectedTransactionbyId.Vout.hex)
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
        dshWallet?.getTransactionsHistory(for: addressFrom, result: { (result) in
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
        dshWallet?.getUTxo(for: addressFrom, result: { (result) in
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
        dshWallet?.sendTransaction(with: transactionData, result: { (result) in
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
