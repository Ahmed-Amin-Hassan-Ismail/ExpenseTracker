//
//  RecentTransactionListView.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import SwiftUI

struct RecentTransactionListView: View {
    //MARK: - Variables
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    //MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                //MARK: - Navigation Link
                NavigationLink {
                    TransactionListView()
                    
                } label: {
                    HStack(spacing: 5) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                            
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            //MARK: - Recent Transaction List
            getFirstFiveTransactions()
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

//MARK: - Helper Methods
extension RecentTransactionListView {
    private func getFirstFiveTransactions() -> some View {
        return ForEach(Array(transactionListViewModel.transactions.prefix(5).enumerated()), id: \.element) { (index, transaction) in
            TransactionRowView(transaction: transaction)
            
            Divider()
                .opacity(index == 4 ? 0 : 1)
        }
    }
}

struct RecentTransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionListView()
            .environmentObject(TransactionListViewModel())
    }
}
