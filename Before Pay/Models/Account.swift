//
//  Account.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import Foundation

struct Account: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let income: Double
    let spent: Double
    var lastUpdated: Date?
    var icon: String?
    var subAccounts: [Account]?
    
    var balance: Double {
        (income - spent)
    }
    
    var balanceWhole: String {
        let formatter = NumberFormatter.currencyFormatter
        formatter.minimumFractionDigits = 0
        return formatter.string(from: (income - spent) as NSNumber) ?? ""
    }
    
    var incomeWhole: String {
        let formatter = NumberFormatter.currencyFormatter
        formatter.minimumFractionDigits = 0
        return formatter.string(from: income as NSNumber) ?? ""
    }
    
    var spentWhole: String {
        let formatter = NumberFormatter.currencyFormatter
        formatter.minimumFractionDigits = 0
        return formatter.string(from: spent as NSNumber) ?? ""
    }
    
    static var testAccounts: [Account] {
        var accounts = [Account]()
        accounts.append(
            Account(name: "All accounts", income: 3001, spent: 1450,
                    subAccounts: [
                        Account(name: "Westpac", income: 1050, spent: 605, lastUpdated: Date()),
                        Account(name: "Commbank", income: 149, spent: 0, lastUpdated: Date())
                    ]
            )
        )
        
        accounts.append(
            Account(name: "Westpac", income: 1050, spent: 605, lastUpdated: Date(), icon: "icon-bank-westpac",
                    subAccounts: [
                        Account(name: "Choice", income: 300, spent: 12, lastUpdated: Date()),
                        Account(name: "Savings", income: 112, spent: 11, lastUpdated: Date())
                    ]
            )
        )
        
        accounts.append(
            Account(name: "Commbank", income: 149, spent: 0, lastUpdated: Date(), icon: "icon-bank-commbank")
        )
        return accounts
    }
}
