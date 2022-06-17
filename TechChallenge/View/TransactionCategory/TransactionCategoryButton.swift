//
//  TransactionCategoryButton.swift
//  TechChallenge
//
//  Created by Jonathan Agarrat on 6/15/22.
//

import SwiftUI

struct TransactionCategoryButton: View {
    
    @EnvironmentObject var transitionVM: TransactionViewModel
    
    let category: TransactionModel.Category?
    
    @Binding var selectedCategory: TransactionModel.Category?
    
    var body: some View {
        Button {
            transitionVM.updateCategory(with: category)
        } label: {
            
            if selectedCategory == category {
                Text(category?.rawValue ?? "all")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(category?.color ?? Color.black)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .background(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
            } else {
                
                Text(category?.rawValue ?? "all")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(category?.color ?? Color.black)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 16)
                    .mask(RoundedRectangle(cornerRadius: 16))
            }
                
            
        }
    }
}

struct TransactionCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        let x: TransactionModel.Category = .food
        TransactionCategoryButton(category: x, selectedCategory: .constant(.food))
            .environmentObject(TransactionViewModel())
    }
}
