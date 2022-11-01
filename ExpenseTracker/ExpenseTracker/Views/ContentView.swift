//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 25) {
                
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: setupNotificationIcon())
        }
        .navigationViewStyle(.stack)
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
    }
}
