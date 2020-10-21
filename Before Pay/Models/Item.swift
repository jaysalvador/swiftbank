//
//  Item.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import Foundation

enum Category: Int, CaseIterable, Identifiable {
    case groceries
    case restaurants
    case household
    
    var id: Int {
        self.rawValue
    }
    
    var image: String {
        switch self {
        case .groceries:
            return "icon-grocery"
        case .household:
            return "icon-household"
        case .restaurants:
            return "icon-restaurant"
        }
    }
    
    var description: String {
        switch self {
        case .groceries:
            return "Groceries"
        case .household:
            return "Household"
        case .restaurants:
            return "Restaurant"
        }
    }
}

struct Item {
    var value: Double
    var category: Category
    
    var amount: String {
        let formatter = NumberFormatter.currencyFormatter
        formatter.minimumFractionDigits = 2
        return formatter.string(from: value as NSNumber) ?? ""
    }
    
    var amountWhole: String {
        let formatter = NumberFormatter.currencyFormatter
        formatter.minimumFractionDigits = 0
        return formatter.string(from: value as NSNumber) ?? ""
    }
}
