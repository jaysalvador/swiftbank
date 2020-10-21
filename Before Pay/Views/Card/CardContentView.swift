//
//  CardContentView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import SwiftUI

struct CardContentView: View {
    @State var cardType: CardViewType
    @State var account: Account
    @State var total: Double?
    
    var body: some View {
        VStack(spacing: 0) {
            
            /// top border
            Rectangle()
                .fill(cardType.separatorColor)
                .frame(height: 1)
                .padding(.bottom, 7)
                .isHidden(self.total == nil, remove: self.total == nil)
            
            /// name and date
            HStack(spacing: 0) {
                ZStack {
                    Circle()
                        .foregroundColor(.white)
                    Image(account.icon ?? "")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
                .padding(.trailing, 8)
                .frame(width: 32)
                .isHidden(account.icon == nil, remove: account.icon == nil)
                
                Text(account.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(self.cardType.titleColor)
                Spacer()
                Text("⟳")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(self.cardType.timeColor)
                    .padding(.bottom, 4)
                    .padding(.trailing, 4)
                Text("4hrs ago")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(self.cardType.timeColor)
            }
            .frame(height: 32)
            .padding(.vertical, 16)
            
            /// balance
            HStack(spacing: 0) {
                Text(account.balanceWhole)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(self.cardType.titleColor)
                    .padding(.trailing, 12)
                Text("Available balance")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(self.cardType.subtitleColor)
            }
            .frame(height: 32)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 24)
            
            /// Capsule graph
            AccountBarView(cardType: self.cardType, account: account, total: self.total)
                .padding(.bottom, 28)
            
            ///bills
            HStack(spacing: 0) {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient.orangeGradient,
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                    .frame(width: 8, height: 8)
                    .padding(.trailing, 8)
                Text("\(account.spentWhole) ")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(self.cardType.subtitleColor)
                Text("Spent")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(cardType.subtitleColor)
                Spacer()
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient.greenGradient,
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: 8, height: 8)
                    .padding(.trailing, 8)
                Text("\(account.incomeWhole) ")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(self.cardType.subtitleColor)
                Text("Income")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(self.cardType.subtitleColor)
            }
            .frame(height: 16)
            .padding(.bottom, 31)
        }
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            gradient: Gradient.blueGradient,
                            startPoint: .trailing,
                            endPoint: .leading
                        )
                    )
                CardContentView(
                    cardType: .blue,
                    account: Account.testAccounts.first!
                )
                .padding(16)
            }
            .padding(20)
            .frame(
                width: UIScreen.main.bounds.width,
                height: 204
            )
        }
    }
}
