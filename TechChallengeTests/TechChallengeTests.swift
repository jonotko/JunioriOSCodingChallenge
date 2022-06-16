//
//  TechChallengeTests.swift
//  TechChallengeTests
//
//  Created by Adrian Tineo Cabello on 30/7/21.
//

import XCTest
@testable import TechChallenge

class TechChallengeTests: XCTestCase {
    
    let transactionViewModel: TransactionViewModel = TransactionViewModel(transactions: ModelData.sampleTransactions)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTransactionFilterAll() throws {
        // When (category starts as nil for all transaction)
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: nil)

        // Then
        XCTAssertEqual(filteredTransaction.count, 13)

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTransactionFilterFood() throws {

        // When
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: TransactionModel.Category.food)

        // Then
        XCTAssertEqual(filteredTransaction.count, 5)
    }
    
    func testTransactionFilterHealth() throws {

        // When
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: TransactionModel.Category.health)

        // Then
        XCTAssertEqual(filteredTransaction.count, 1)
    }
    
    func testTransactionFilterEntertainment() throws {

        // When
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: TransactionModel.Category.entertainment)

        // Then
        XCTAssertEqual(filteredTransaction.count, 1)
    }
    
    func testTransactionFilterShopping() throws {

        // When
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: TransactionModel.Category.shopping)

        // Then
        XCTAssertEqual(filteredTransaction.count, 3)
    }
    
    
    func testTransactionFilterTravel() throws {

        // When
        let filteredTransaction = transactionViewModel.getTransactionsFor(category: TransactionModel.Category.travel)

        // Then
        XCTAssertEqual(filteredTransaction.count, 3)
    }
    
    
    func testTransactionSumForCategoryAll() throws{
        
        // When
        let sum: String = transactionViewModel.sumTransactions(with: nil)
        
        XCTAssertEqual(sum, "472.08")
    }
    
    
    func testTransactionSumForCategoryFood() throws{
        
        // When
        let sum: String = transactionViewModel.sumTransactions(with: .food)
        
        XCTAssertEqual(sum, "74.28")
    }
    
    func testTransactionSumForCategoryHealth() throws{
        
        // When
        let sum: String = transactionViewModel.sumTransactions(with: .health)
        
        XCTAssertEqual(sum, "21.53")
    }
    
    func testTransactionSumForCategoryEntertainment() throws{
        
        // When
        let sum: String = transactionViewModel.sumTransactions(with: .entertainment)
        
        XCTAssertEqual(sum, "82.99")
    }
    
    func testTransactionSumForCategoryShopping() throws{
    
        // When
        let sum: String = transactionViewModel.sumTransactions(with: .shopping)
        
        XCTAssertEqual(sum, "78.00")
    }
    
    func testTransactionSumForCategoryTravel() throws{
        
        // When
        let sum: String = transactionViewModel.sumTransactions(with: .travel)
        
        XCTAssertEqual(sum, "215.28")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
