//
//  TransactionCategoryButton.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/15/22.
//

import SwiftUI

struct TransactionCategoryButton: View {
    
    @EnvironmentObject var transitionVM: TransactionViewModel
    
    let category: TransactionModel.Category
    
    var body: some View {
        Button {
            transitionVM.updateCategory(with: category)
            transitionVM.updateSum(with: category)
        } label: {
            Text(category.rawValue)
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .background(category.color)
                .mask(RoundedRectangle(cornerRadius: 16))
                
            
        }
    }
}

struct TransactionCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        let x: TransactionModel.Category = .food
        TransactionCategoryButton(category: x)
            .environmentObject(TransactionViewModel())
    }
}
