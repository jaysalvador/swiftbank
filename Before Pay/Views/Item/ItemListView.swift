//
//  ItemListView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 21/10/20.
//

import SwiftUI

struct ItemListView: View {
    var body: some View {
        HStack {
            ForEach(Category.allCases) { category in
                ItemView(item: Item(value: 200, category: category))
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 20)
                ItemListView()
            }
            .frame(height: 144.0)
            .padding(.horizontal, 20.0)
        }
    }
}
