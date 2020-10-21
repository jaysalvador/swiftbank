//
//  ContentView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 18/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var isExpanded: Bool = false
    @State private var account: Account?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        NavigationBarView(
                            account: self.account,
                            onBackButtonTapped: {
                                self.account = nil
                                self.isExpanded = false
                            }
                        )
                        .padding(.top, self.isExpanded ? 8 : 24)
                        .padding(.bottom, 35)
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width)
                        .animation(.spring())
                        
                        CardCarouselView(
                            isExpanded: !self.isExpanded,
                            onCardStateChanged: { (account, hasExpandedCard) in
                                self.isExpanded = hasExpandedCard
                                self.account = hasExpandedCard ? account : nil
                            }
                        )
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            SpendDashboardView()
                                .padding(.top, 40.0)
                                .padding(.horizontal, 20.0)
                                .frame(width: UIScreen.main.bounds.width)
                                .isHidden(self.isExpanded, remove: self.isExpanded)
                        }
                        .animation(.easeOut(duration: 0.5), value: !self.isExpanded)
                        .animation(.easeIn(duration: 0.2), value: self.isExpanded)
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .frame(width: UIScreen.main.bounds.width)
                VStack {
                    Spacer()
                    TabView()
                }
                .frame(width: UIScreen.main.bounds.width)
            }
            
            Group {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
