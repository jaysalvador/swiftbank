//
//  ItemView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 21/10/20.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    var body: some View {
        Button(action: {
            
        }) {
            VStack(spacing: 0) {
                Image(item.category.image)
                    .padding(.bottom, 8)
                Text(item.category.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.gray)
                    .padding(.bottom, 2)
                    .frame(height: 24.0)
                Text("\(item.amountWhole)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                    .frame(height: 24.0)
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemView(item: Item(value: 300, category: Category.groceries))
        }
    }
}
