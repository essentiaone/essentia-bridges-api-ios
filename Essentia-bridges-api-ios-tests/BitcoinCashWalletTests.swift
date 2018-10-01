//
//  BitcoinCashWalletTests.swift
//  Essentia-bridges-api-ios-tests
//
//  Created by Binomial on 27.09.2018.
//  Copyright © 2018 Essentia. All rights reserved.
//

import XCTest
@testable import essentia_bridges_api_ios
import HDWalletKit

private var url = "https://b3.essentia.network"
private var apiVersion = "/api/v1"
private var serverUrl = url + apiVersion

private var addressFrom: Address = "qzs02v05l7qs5s24srqju498qu55dwuj0cx5ehjm2c"
private var transactionData =
    ["02000000014fe69799ba112fbe7210bb46a24abdb2b4c7aae12db4e2b0c7fe88996734fbe0",
     "010000006b483045022100e9753329e4a51d72b8ae5971b70646100d0e8b8e9655b5980347",
     "217d5ec008d702203fdcadec793b227baf976706d08b68de358650ba2a7368a7f55e193f13",
     "5f28b8012102c0e4768ae9a4f4fbdb42f438695033abc61a8c1f77573ff7273f5b461d264f",
     "00ffffffff0210270000000000001976a9146e81f8092d4b5b5a20d7257d042b0b170b5056",
     "cc88ac103a0100000000001976a9143936070b1eded9950affc4444953c2bb1e5abce388ac00000000"].joined()

private var expectedTxId: String =  "f53fb9bcdde78bcf580efacb6ce777bde5e345a9392e5ed3f3e84fe15a63cf1a"
private var expectedBalance = 0.00126419

private struct ExpectedTransactionHistory {
    static public let fromNumber: Int = 0
    static public let toNumber: Int = 15
    static public let totalItems: Int = 15
}


private struct ExpectedTransactionbyId {
    static public let blockhash: String = "000000000000000001df56329b3831c92b953c2266f97ee7d7632b3d37a1234d"
    static public let blockheight: Int = 550283
    static public let blocktime: Int = 1538397562
    static public let confirmations: Int = 23
    static public let fees: Double = 0
    static public let size: Int = 121
    static public let time: Int = 1538397562
    static public let txid: String = "f53fb9bcdde78bcf580efacb6ce777bde5e345a9392e5ed3f3e84fe15a63cf1a"
    static public let valueIn: Double = 0
    static public let valueOut: Double = 12.53848559
    
    public struct Vin {
        static public let coinbase: String = "038b6508174d696e656420627920416e74506f6f6c353c205bb2157a502a000027160300"
        static public let sequence: Int = 4294967295
        static public let number: Int = 0
    }
    public struct Vout {
        static public let addresses: [String] = ["13usM2ns3f466LP65EY1h8hnTBLFiJV6rD"]
        static public let txid: String? = nil
        static public let value: String = "12.53848559"
    }
}

class BitcoinCashTests: XCTestCase {
    var bchWallet: BitcoinCashWallet?
    
    override func setUp() {
        bchWallet = BitcoinCashWallet(serverUrl)
    }
    
    func testGetBalance() {
        let expectation = self.expectation(description: "Get balance")
        bchWallet?.getBalance(for: addressFrom, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object.result, expectedBalance)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTransactionsHistory() {
        let expectation = self.expectation(description: "Get transactions history")
        bchWallet?.getTransactionsHistory(for: addressFrom, result: { (result) in
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
   
    func testGetTransactionById() {
        let expectation = self.expectation(description: "Get transaction by id")
        bchWallet?.getTransactionById(for: expectedTxId, result: { (result) in
            switch result {
            case .success(let object):
                XCTAssertEqual(object.result.blockhash, ExpectedTransactionbyId.blockhash)
                XCTAssertEqual(object.result.blocktime, ExpectedTransactionbyId.blocktime)
                XCTAssertEqual(object.result.blockheight, ExpectedTransactionbyId.blockheight)
                XCTAssertEqual(object.result.size, ExpectedTransactionbyId.size)
                XCTAssertEqual(object.result.time, ExpectedTransactionbyId.time)
                XCTAssertEqual(object.result.txid, ExpectedTransactionbyId.txid)
                XCTAssertEqual(object.result.fees, ExpectedTransactionbyId.fees)
                XCTAssertEqual(object.result.valueIn, ExpectedTransactionbyId.valueIn)
                XCTAssertEqual(object.result.valueOut, ExpectedTransactionbyId.valueOut)
                XCTAssertEqual(object.result.vin[0].coinbase, ExpectedTransactionbyId.Vin.coinbase)
                XCTAssertEqual(object.result.vin[0].sequence, ExpectedTransactionbyId.Vin.sequence)
                XCTAssertEqual(object.result.vin[0].number, ExpectedTransactionbyId.Vin.number)
                XCTAssertEqual(object.result.vout[0].scriptPubKey.addresses, ExpectedTransactionbyId.Vout.addresses)
                XCTAssertEqual(object.result.vout[0].value, ExpectedTransactionbyId.Vout.value)
                XCTAssertEqual(object.result.vout[0].spentTxId, ExpectedTransactionbyId.Vout.txid)
                expectation.fulfill()
            case .failure:
                XCTFail(expectation.description)
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testSendTX() {
        let expectation = self.expectation(description: "Send TX")
        bchWallet?.sendRawTransaction(with: transactionData, result: { (result) in
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
