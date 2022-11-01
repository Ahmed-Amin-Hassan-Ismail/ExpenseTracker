//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import Foundation


//MARK: - Transaction
struct Transaction: Identifiable, Codable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var dateParsed: Date {
        return date.dateParsed()
    }
    
    var signedAmount: Double {
        return (type == TransactionType.credit.rawValue) ? amount : -amount
    }
}
