//
//  TabView.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 21/10/20.
//

import SwiftUI

enum Tab: Int, CaseIterable, Identifiable {
    
    case overview
    case budget
    case lend
    case profile
    
    var id: Int {
        self.rawValue
    }
    
    var image: String {
        switch self {
        case .overview:
            return "tab-overview"
        case .budget:
            return "tab-budget"
        case .lend:
            return "tab-lend"
        case .profile:
            return "tab-profile"
        }
    }
}

struct TabView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 36.5)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 24, x: 0, y: 20)
            HStack {
                ForEach(Tab.allCases) { value in
                    Button(action: {
                        
                    }) {
                        Image(value.image)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 18)
        }
        .frame(height: 73.5)
        .padding(.horizontal, 20.0)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabView()
        }
    }
}
