//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListViewModel = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListViewModel)
        }
    }
}
