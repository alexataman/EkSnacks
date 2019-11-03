//
//  Date+Extension.swift
//  EkreativeSnacks
//
//  Created by Alex on 11/1/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import Foundation

extension Date {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.calendar = Calendar(identifier: .iso8601)
        
        return formatter
    }()
    
    var current: String {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        return "\(year)-\(month)-\(day)"
    }
    
    var dayOfMonth: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        return dateFormatter.string(from: self)
    }
}
