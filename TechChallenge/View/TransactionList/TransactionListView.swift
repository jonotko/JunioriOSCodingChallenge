//
//  TransactionListView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                
                TransactionCategoryView()
                
                List {
                    ForEach(transactionVM.filteredTransactions)
                    { transaction in
                            TransactionView(transaction: transaction)
                        }
                }
                .animation(.easeIn)
                .listStyle(PlainListStyle())
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Transactions")
            }
            .padding(.bottom, 100)
            TransactionSumView(category: transactionVM.transactionSelectedCategory, transactionSum: transactionVM.transactionsTotal)
        }
    }
}

#if DEBUG
struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView()
            .environmentObject(TransactionViewModel())
    }
}
#endif
