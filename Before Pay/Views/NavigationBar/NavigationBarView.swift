//
//  NavigationBarView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 21/10/20.
//
import SwiftUI

struct NavigationBarView: View {
    var account: Account?
    
    var onBackButtonTapped: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            Button(
                action: {
                    self.onBackButtonTapped?()
                },
                label: {
                    Image("icon-arrow-back")
                }
            )
            .padding(.trailing, 12)
            .isHidden(self.account == nil, remove: self.account == nil)
            
            Text(account?.name ?? "Home")
                .font(.system(size: 24, weight: .bold))
                .frame(height: 29)
            Spacer()
            Button(action: {
                
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 36.5)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 20)
                    HStack {
                        Text("Monthly")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black)
                        Image("icon-arrow-down")
                    }
                }
            }
            .frame(width: 103, height: 32)
        }
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationBarView()
                .padding(.top, 24)
                .padding(.bottom, 35)
                .padding(.horizontal, 20)
                .frame(width: UIScreen.main.bounds.width)
        }
    }
}
