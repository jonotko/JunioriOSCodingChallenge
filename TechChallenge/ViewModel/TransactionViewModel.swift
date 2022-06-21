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
    
    
    init(transactions: [TransactionModel] = ModelData.sampleTransactions){
        self.transactions = transactions
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
    
    func pinTransactionWith(id: Int){
        for index in 0..<transactions.count {
            if transactions[index].id == id {
                transactions[index].isPinned.toggle()
            }
        }
    }
    
    func sumTransactions(with category: TransactionModel.Category?) -> String {
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
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return  formatter.string(from: NSNumber(value: sum)) ?? "0"
    }
}
