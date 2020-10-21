//
//  SpendDashboardView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 21/10/20.
//

import SwiftUI

struct SpendDashboardView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("Money Spent")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
                Button("View all") {
                    
                }
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.fontBlue)
            }
            .padding(.bottom, 16.0)
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 20)
                ItemListView()
            }
            .frame(height: 144.0)
                
            .multilineTextAlignment(.center)
        }
    }
}

struct SpendDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SpendDashboardView()
                .padding(.top, 40.0)
                .padding(.horizontal, 20.0)
                .frame(width: UIScreen.main.bounds.width)
        }
    }
}
