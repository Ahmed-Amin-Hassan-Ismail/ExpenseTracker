//
//  TransactionRowView.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRowView: View {
    //MARK: - Variables
    var transaction: Transaction
    
    //MARK: - Body
    var body: some View {
        HStack(spacing: 20) {
            //MARK: - Trasnaction Category Icon
            Circle()
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                //MARK: - Transaction Merchant
                Text(transaction.merchant)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .lineLimit(1)
                
                //MARK: - Transaction Category
                Text(transaction.category)
                    .font(.system(.footnote, design: .rounded))
                    .opacity(0.7)
                    .lineLimit(1)
                
                //MARK: - Transaction Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.system(.footnote, design: .rounded))
                    .foregroundColor(.secondary)
            }
            Spacer()
            
            //MARK: - Transaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .foregroundColor(checkIfTransactionTypeIsCredit() ? Color.text : Color.primary )
        }
    }
}

//MARK: - Helper Methods
extension TransactionRowView {
    private func checkIfTransactionTypeIsCredit() -> Bool {
        return transaction.type == TransactionType.credit.rawValue
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView(transaction: transactionPreviewData)
    }
}
