//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @EnvironmentObject var transactionListViewModel: TransactionListViewModel
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 25) {
                //MARK: - Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    //MARK: - Chart
                    let data = transactionListViewModel.accumulateTransactions()
                    if !data.isEmpty {
                        let totlaExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totlaExpenses.formatted(.currency(code: "USD")), type: .title, format: "$%.02f")
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(
                            ChartStyle(
                                backgroundColor: Color.systemBackground,
                                foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon))
                        )
                    .frame(height: 300)
                    }
                    
                    //MARK: - Trasnaction List
                    RecentTransactionListView()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: setupNotificationIcon())
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

//MARK: - Helper Methods
extension ContentView {
    private func setupNotificationIcon() -> some View{
        return Image(systemName: "bell.badge")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.icon, .primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(TransactionListViewModel())
    }
}
