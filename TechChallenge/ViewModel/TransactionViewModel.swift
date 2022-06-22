//
//  TransactionViewModel.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/15/22.
//

import Foundation

class TransactionViewModel: ObservableObject {
    
    @Published private(set) var transactionSelectedCategory: TransactionModel.Category = .all {
        didSet {
            updateFilterTransaction()
        }
    }
    
    @Published private(set) var transactions: [TransactionModel]
    
    @Published private(set) var filteredTransactions: [TransactionModel] = []
    
    @Published private(set) var transactionsTotal: Double = 0.0
    
    
    init(transactions: [TransactionModel] = ModelData.sampleTransactions){
        self.transactions = transactions
        filteredTransactions = transactions
        transactionsTotal = sumTransactions(with: .all)
        
    }
    
    private func updateFilterTransaction(){
        if transactionSelectedCategory == .all {
            filteredTransactions = transactions
        } else {
            filteredTransactions = getTransactionsFor(category: transactionSelectedCategory)
        }

    }
    
    func getTransactionsFor(category: TransactionModel.Category) -> [TransactionModel]{
        switch category {
        case .all:
            return self.transactions
        default:
            let filteredTransactions = transactions.filter({ item in category == item.category })
            return filteredTransactions
            
        }
    }
    
    func updateCategory(with category: TransactionModel.Category) {
        transactionSelectedCategory = category
        
    }
    
    func updateSum(with category: TransactionModel.Category){
        transactionsTotal = sumTransactions(with: category)
    }
    
    func pinTransactionWith(id: Int){
        for index in 0..<transactions.count {
            if transactions[index].id == id {
                transactions[index].isPinned.toggle()
            }
        }
        
        updateFilterTransaction()
        updateSum(with: transactionSelectedCategory)
    }
    
    func sumTransactions(with category: TransactionModel.Category) -> Double {
        var sum: Double = 0
        
        switch category{
            
        case .all:
            for transaction in transactions {
                sum += transaction.isPinned ? transaction.amount : 0
            }
        default:
            for transaction in transactions {
                if transaction.category == category {
                    
                    sum += transaction.isPinned ? transaction.amount : 0
                }
            }
        }

        return  sum
    }
}
