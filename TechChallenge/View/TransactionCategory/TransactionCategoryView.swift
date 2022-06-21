//
//  TransactionCategoryView.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/15/22.
//

import SwiftUI

struct TransactionCategoryView: View {
    
    //@EnvironmentObject var transactionViewModel: TransactionViewModel

    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                TransactionCategoryButton(category: nil)
                
                ForEach(TransactionModel.Category.allCases, id: \.id){
                    category in
                    TransactionCategoryButton(category: category)
                }
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
            .background(Color.accentColor.opacity(0.8))
        }
    }
}

struct TransactionCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCategoryView()
            //.environmentObject(TransactionViewModel())
    }
}
