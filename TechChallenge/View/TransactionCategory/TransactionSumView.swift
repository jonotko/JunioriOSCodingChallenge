//
//  TransactionSumView.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/16/22.
//

import SwiftUI

struct TransactionSumView: View {
    
    let category: TransactionModel.Category?
    
    let transactionSum: Double
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Text(category?.rawValue ?? "all")
                    .font(.headline)
                    .foregroundColor(category?.color ?? Color.black)
            }
            HStack{
                Text("Total Spent")
                    .fontWeight(.regular)
                    .secondary()
                
                Spacer()
                
                Text("$\(transactionSum.formatted())")
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
        TransactionSumView(category: nil, transactionSum: 0.0)
    }
}
