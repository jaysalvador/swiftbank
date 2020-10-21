//
//  CardCarouselView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import SwiftUI

struct CardCarouselView: View {
    
    var isExpanded: Bool {
        didSet {
            self.resetCardState()
        }
    }
    
    var onCardStateChanged: ((Account, Bool) -> Void)?
    
    @State var prevX: CGFloat = 0
    @State var x: CGFloat = 0
    @State var prevPage: Int = 0
    @State var page: Int = 0
    @State var offset: CGFloat = 0
    @State var cardState: [Int: Bool] = [:]
    
    let spacing: CGFloat = 16
    let accounts = Account.testAccounts
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: self.spacing) {
                ForEach(accounts.indices) { i in
                    CardView(
                        cardType: (i == 0 ? .blue : .white),
                        account: accounts[i],
                        isExpanded: self.isCardExpanded(i)
                    )
                    .offset(x: self.x)
                    .highPriorityGesture(
                        DragGesture()
                            .onChanged(self.dragGestureOnChanged)
                            .onEnded(self.dragGestureOnEnded)
                    )
                    .onTapGesture  {
                        guard !self.hasExpandedCard else { return }
                        self.cardState[i] = !self.isCardExpanded(i)
                        
                        if self.hasExpandedCard {
                            self.prevX = self.x
                            self.prevPage = self.page
                            self.x = 0
                            self.page = 0
                        }
                        else {
                            self.x = self.prevX
                            self.page = self.prevPage
                        }
                        self.offset = self.computedOffset
                        
                        self.onCardStateChanged?(accounts[i], self.hasExpandedCard)
                    }
                    .isHidden(self.isCardHidden(i), remove: self.isCardHidden(i))
                }
            }
            .offset(x: self.offset)
            .animation(.easeIn)
            .onAppear {
                self.offset = self.computedOffset
            }
            
            CardCarouselPageIndicatorView(cardCount: accounts.count, page: self.page)
                .padding(.top, 24)
                .isHidden(self.hasExpandedCard, remove: self.hasExpandedCard)
                .animation(.easeIn(duration: 0.175))
        }
        .onChange(of: self.isExpanded, perform: { value in
            self.resetCardState()
        })
    }
    
    private var cardCount: Int {
        accounts.count > 0 ? (self.hasExpandedCard ? 1 : accounts.count) : 0
    }
    
    private var hasExpandedCard: Bool {
        self.cardState.first { $1 == true } != nil
    }
    
    private var computedOffset: CGFloat {
        (CardView.cardWidth + self.spacing) * CGFloat(self.cardCount/2) - (self.cardCount % 2 == 0 ? (CardView.cardWidth + self.spacing) / 2 : 0) - self.negOffset
    }

    private var negOffset: CGFloat {
        self.hasExpandedCard ? 0 : (UIScreen.main.bounds.width > 375 ? 30 : 10)
    }
    
    private func isCardExpanded(_ item: Int) -> Bool {
        self.cardState[item] ?? false
    }
    
    private func isCardHidden(_ item: Int) -> Bool {
        self.hasExpandedCard && !self.isCardExpanded(item)
    }
    
    private func resetCardState() {
        guard !self.isExpanded else { return }
        self.cardState.forEach { self.cardState[$0.key] = false }
        self.x = self.prevX
        self.page = self.prevPage
        self.offset = self.computedOffset
    }
    
    private func dragGestureOnChanged(_ value: DragGesture.Value) -> Void {
        guard !self.hasExpandedCard else { return }
        if value.translation.width > 0 {
            self.x = value.location.x
        }
        else {
            self.x = value.location.x - CardView.cardWidth
        }
    }
    
    private func dragGestureOnEnded(_ value: DragGesture.Value) -> Void {
        guard !self.hasExpandedCard else { return }
        if value.translation.width > 0 {
            if self.page != 0 && value.translation.width > (CardView.cardWidth / 2) {
                self.page -= 1
                self.x = -(CardView.cardWidth + self.spacing) * CGFloat(self.page)
                self.x += self.page == 0 ? 0 : self.negOffset
            }
            else {
                self.x = -(CardView.cardWidth + self.spacing) * CGFloat(self.page)
                self.x += self.negOffset
            }
        }
        else {
            if self.page != (self.cardCount - 1) && -value.translation.width > (CardView.cardWidth / 2) {
                self.page += 1
                self.x = -(CardView.cardWidth + self.spacing) * CGFloat(self.page)
                self.x += self.negOffset
            }
            else {
                self.x = -(CardView.cardWidth + self.spacing) * CGFloat(self.page)
                self.x += self.negOffset
            }
        }
    }
    
}

struct CardCarouselPageIndicatorView: View {
    let pageColor = Color.init(hex: "999999")
    var cardCount: Int
    var page: Int
    var body: some View {
        HStack(spacing: 6) {
            ForEach(0..<cardCount) { i in
                let width: CGFloat = i == page ? 24 : 8
                let color: Color = i == page ? pageColor : pageColor.opacity(0.15)
                
                Capsule().frame(width: width, height: 8)
                    .foregroundColor(color)
                    .animation(.spring())
            }
        }
    }
}

struct CardCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardCarouselView(isExpanded: false)
        }
    }
}
