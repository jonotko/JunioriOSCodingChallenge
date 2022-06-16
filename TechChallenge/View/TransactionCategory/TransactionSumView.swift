//
//  TransactionSumView.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/16/22.
//

import SwiftUI

struct TransactionSumView: View {
    
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    let category: TransactionModel.Category?
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text(transactionVM.transactionSelectedCategory?.rawValue ?? "all")
                    .font(.headline)
                    .foregroundColor(transactionVM.transactionSelectedCategory?.color ?? Color.black)
            }
            HStack{
                Text("Total Spent")
                    .fontWeight(.regular)
                    .secondary()
                
                Spacer()
                
                Text("$\(transactionVM.sumTransactions(with: category))")
                    .fontWeight(.bold)
                    .secondary()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 40)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 2)
                .foregroundColor(Color.accentColor)
        )
        .padding()
        .background(Color.white)
    }
}

struct TransactionSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSumView(category: nil)
            .environmentObject(TransactionViewModel())
    }
}
