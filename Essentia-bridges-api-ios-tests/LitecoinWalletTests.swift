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

fileprivate var addressFrom = "LTNJvXUJeRi41DJuEg5V3zWRhUisC3KUtF"
fileprivate var privateKey = "cQdNbjP1DbVCHfAvUhzEhGZ1GFTu9568E95HCJwofWBPuqcYHMmC"
fileprivate var addressTo = "2N8hwP1WmJrFF5QWABn38y63uYLhnJYJYTF"
fileprivate var seed = """
                       8fw6c14e42b994c6d9da0b1c1cf5657c9445c7580913770cf6e61584535fe1ae
                       d9bd1f093d02aed53db15a5ce9c06edf60e6beb2a72c356337e0adf7310b941w
                       """
fileprivate var transactionHash = """
                                01000000018fa772716891fa23e449c30b1fd239d747ebb9838126cf8c1d4c7d97c182259b010000006a4730440
                                2203c8f0c0889beeb330b39391bc4c22fd88b304c2bc23d5b567f3ecf351d39f6890220265a9c21e1f40349476c
                                b0c07a701ceb807c7d629fe5df1d02a64609e737e93e0121034119bd5cf05e3548997948635173b4848892ea855
                                30d9523b3ddfa4fec5ff59affffffff0240420f00000000001976a914cf56a629660e236e88915ee72529f825cc
                                9dfccc88ac00aa2e40000000001976a91455d41493d5a337fa46bc80ef46050eb6b65a496188ac00000000
                                """
fileprivate var expectedBalance = 0.00579998


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
  
}
