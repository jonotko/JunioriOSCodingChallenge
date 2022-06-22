//
//  InsightsView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

struct InsightsView: View {
    
    @EnvironmentObject var transactionVM: TransactionViewModel
    
    var body: some View {
        List {
            ForEach(TransactionModel.Category.allCases[1...]) { category in
                let sum = transactionVM.sumTransactions(with: category)
                HStack {
                    Text(category.rawValue)
                        .font(.headline)
                        .foregroundColor(category.color)
                    Spacer()
                    // TODO: calculate cummulative expense for each category
                    Text("$\(sum.formatted())")
                        .bold()
                        .secondary()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Insights")
    }
}

#if DEBUG
struct InsightsView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
            .environmentObject(TransactionViewModel())
            .previewLayout(.sizeThatFits)
    }
}
#endif
