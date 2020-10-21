//
//  AccountBarView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import SwiftUI

struct AccountBarView: View {
    @State var cardType: CardViewType
    @State var account: Account
    @State var total: Double?
    
    let height: CGFloat = 8
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                let totalIncome = self.total ?? self.account.income + self.account.spent
                let spentPercentage = CGFloat(self.account.spent / totalIncome)
                let incomePercentage = CGFloat(self.account.income / totalIncome)
                
                let spacing: CGFloat = self.account.spent > 0 ? 4 : 0
                
                let width = (geometry.size.width - spacing)
                
                if self.total != nil {
                    Capsule().frame(height: height)
                        .foregroundColor(self.cardType.barColor)
                }
                
                HStack(spacing: spacing) {
                    if self.account.spent > 0 {
                        Capsule()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient.orangeGradient,
                                    startPoint: .trailing,
                                    endPoint: .leading
                                )
                            )
                            .frame(
                                width: width * spentPercentage,
                                height: self.height
                            )
                    }
                    
                    Capsule()
                        .fill(
                            LinearGradient(
                                gradient: Gradient.greenGradient,
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(
                            width: width * incomePercentage,
                            height: self.height
                        )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct AccountBarView_Previews: PreviewProvider {
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
                VStack {
                    Spacer()
                    AccountBarView(
                        cardType: .blue,
                        account: Account.testAccounts.first!
                    )
                    Spacer()
                }
                .padding(16)
            }
            .padding(20)
            .frame(
                width: UIScreen.main.bounds.width,
                height: 100
            )
        }
    }
}
