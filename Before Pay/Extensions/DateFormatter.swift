//
//  DateFormatter.swift
//  Before Pay
//
//  Created by Jay Andrae Salvador on 20/10/20.
//

import Foundation

extension DateFormatter {
    
    /// 2020-06-16T08:15:30
    static let isoDate: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.locale = .current
        return dateFormatter
    }()
    
    static let dayMonthShortYear: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        dateFormatter.locale = .current
        return dateFormatter
    }()
}
