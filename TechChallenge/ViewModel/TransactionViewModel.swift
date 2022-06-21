//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/15/22.
//

import Foundation

class TransactionViewModel: ObservableObject {
    
    @Published var transactionSelectedCategory: TransactionModel.Category? = nil
    
    @Published var transactions: [TransactionModel]
    
    @Published var transactionsTotal: Double = 0.0
    
    
    init(transactions: [TransactionModel] = ModelData.sampleTransactions){
        self.transactions = transactions
        transactionsTotal = sumTransactions(with: nil)
        
    }
    
    func getTransactionsFor(category: TransactionModel.Category?) -> [TransactionModel]{
        let filteredTransactions = transactions.filter({ item in
            if let selectedCategory = category {
                return selectedCategory == item.category
            }
            return true
        })
        
        return filteredTransactions
    }
    
    func updateCategory(with category: TransactionModel.Category? = nil) {
        transactionSelectedCategory = category
        
    }
    
    func updateSum(with category: TransactionModel.Category? = nil){
        transactionsTotal = sumTransactions(with: category)
    }
    
    func pinTransactionWith(id: Int){
        for index in 0..<transactions.count {
            if transactions[index].id == id {
                transactions[index].isPinned.toggle()
            }
        }
        
        updateSum(with: transactionSelectedCategory)
    }
    
    func sumTransactions(with category: TransactionModel.Category?) -> Double {
        var sum: Double = 0
        
        if let category = category {
            for transaction in transactions {
                if transaction.category == category {
                    
                    sum += transaction.isPinned ? transaction.amount : 0
                }
            }
        } else {
            for transaction in transactions {
                sum += transaction.isPinned ? transaction.amount : 0
            }
        }
        
        return  sum
    }
}
