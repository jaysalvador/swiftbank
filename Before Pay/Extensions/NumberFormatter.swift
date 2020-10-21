//
//  NumberFormatter.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import Foundation

extension NumberFormatter {
    
    static let currencyFormatter: NumberFormatter = {
        let formatter =  NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.locale = Locale(identifier: "en_AU")
        formatter.numberStyle = .currency
        formatter.isLenient = true
        return formatter
    }()
}
