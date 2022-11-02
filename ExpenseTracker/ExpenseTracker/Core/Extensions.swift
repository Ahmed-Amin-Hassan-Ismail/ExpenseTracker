//
//  Extensions.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import Foundation
import SwiftUI

//MARK: - Colors
extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(UIColor.systemBackground)
}

//MARK: - DateFormatter
extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
                
        return formatter
    }()
}

//MARK: - String
extension String {
    func dateParsed() -> Date {
        guard let parseDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        return parseDate
    }
}

//MARK: - Date
extension Date {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}

//MARK: - Double
extension Double {
    func roundedToTwoDigits() -> Double {
        return (self * 100).rounded() / 100
    }
}
