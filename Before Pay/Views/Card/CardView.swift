//
//  CardView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import SwiftUI

enum CardViewType {
    case blue
    case white
    
    var titleColor: Color {
        switch self {
        case .blue:
            return Color.white.opacity(0.75)
        case .white:
            return Color(hex: "333333")
        }
    }
    
    var subtitleColor: Color {
        switch self {
        case .blue:
            return Color.white.opacity(0.75)
        case .white:
            return Color(hex: "666666")
        }
    }
    
    var timeColor: Color {
        switch self {
        case .blue:
            return Color.white.opacity(0.75)
        case .white:
            return Color(hex: "999999")
        }
    }
    
    var barColor: Color {
        switch self {
        case .blue:
            return Color.white.opacity(0.1)
        case .white:
            return Color(hex: "F1F1F1")
        }
    }
    
    var separatorColor: Color {
        switch self {
        case .blue:
            return Color.white.opacity(0.25)
        case .white:
            return Color.black.opacity(0.15)
        }
    }
}

struct CardView: View {
    static let cardWidth = UIScreen.main.bounds.width >= 375 ? 316 : UIScreen.main.bounds.width * 0.85
    
    var cardType: CardViewType
    var account: Account
    var isExpanded: Bool
    
    var body: some View {
        let accounts = (self.isExpanded ? (account.subAccounts?.count ?? 0) : 0) + 1
        
        ZStack {
            if self.cardType == .blue {
                blueRectangle
            }
            else {
                whiteRectangle
            }
            VStack(spacing: 0) {
                CardContentView(cardType: cardType, account: account)
                    .padding(.horizontal, 16)
                
                if let subAccounts = account.subAccounts, self.isExpanded {
                    ForEach(subAccounts) { subAccount in
                        CardContentView(cardType: cardType, account: subAccount, total: account.income)
                            .padding(.horizontal, 16)
                            .animation(.easeIn(duration: 0.7), value: self.isExpanded)
                            .animation(.easeOut(duration: 0.175), value: !self.isExpanded)
                    }
                }
            }
        }
        .frame(
            width: self.cardWidth,
            height: 204 * CGFloat(accounts)
        )
        .animation(.easeOut(duration: 0.25), value: self.isExpanded)
        .animation(.easeIn(duration: 0.7), value: !self.isExpanded)
    }
    
    private var cardWidth: CGFloat {
        self.isExpanded ? UIScreen.main.bounds.width - 40 : CardView.cardWidth
    }
    
    var blueRectangle: some View {
        RoundedRectangle(cornerRadius: 24.0)
            .fill(
                LinearGradient(
                    gradient: Gradient.blueGradient,
                    startPoint: self.isExpanded ? .top : .trailing,
                    endPoint: self.isExpanded ? .bottomTrailing : .leading
                )
            )
            .shadow(color: Color.shadowBlue, radius: 29, x: 0, y: 11)
    }
    
    var whiteRectangle: some View {
        RoundedRectangle(cornerRadius: 24.0)
            .fill(
                LinearGradient(
                    gradient: Gradient.whiteGradient,
                    startPoint: self.isExpanded ? .top : .trailing,
                    endPoint: self.isExpanded ? .bottomTrailing : .leading
                )
            )
            .shadow(color: Color.shadowBlack, radius: 29, x: 0, y: 11)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(
                cardType: .white,
                account: Account.testAccounts.first!,
                isExpanded: true
            )
        }
    }
}
