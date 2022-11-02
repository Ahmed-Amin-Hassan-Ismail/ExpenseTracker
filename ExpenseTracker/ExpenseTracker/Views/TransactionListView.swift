//
//  TransactionListView.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 02/11/2022.
//

import SwiftUI

struct TransactionListView: View {
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    var body: some View {
        VStack {
            List {
                //MARK: - Transaction Group
                ForEach(Array(transactionListViewModel.groupTransactionsByMonth()), id: \.key) { month, transactions in
                    
                    Section {
                        //MARK: - Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRowView(transaction: transaction)
                        }
                        
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)

                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TransactionListView()
                .environmentObject(TransactionListViewModel())
        }
    }
}
