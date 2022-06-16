//
//  TransactionView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import SwiftUI

struct TransactionView: View {
    
    @EnvironmentObject var transactionVM: TransactionViewModel
    let transaction: TransactionModel
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.category.rawValue).textCase(.uppercase)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(transaction.category.color)
                    .mask(RoundedRectangle(cornerRadius: 16))
                Spacer()
                
                if transaction.isPinned {
                    
                    Image(systemName: "pin.fill")
                } else {
                    Image(systemName: "pin.slash.fill")
                }
            }
            
            if transaction.isPinned {
                HStack {
                    transaction.image
                        .resizable()
                        .frame(
                            width: 60.0,
                            height: 60.0,
                            alignment: .top
                        )
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(transaction.name)
                            .secondary()
                        Text(transaction.accountName)
                            .tertiary()
                        
                        Text(transaction.date.formatted)
                            .tertiary()
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("$\(transaction.amount.formatted())")
                            .bold()
                            .secondary()
                       
                    }
                }
            }
        }
        .padding(8.0)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        .onTapGesture {
            transactionVM.pinTransactionWith(id: transaction.id)
        }
    }
}

#if DEBUG
struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TransactionView(transaction: ModelData.sampleTransactions[0])
            TransactionView(transaction: ModelData.sampleTransactions[1])
        }
        .padding()
        .previewLayout(.sizeThatFits)
        .environmentObject(TransactionViewModel())
    }
}
#endif
