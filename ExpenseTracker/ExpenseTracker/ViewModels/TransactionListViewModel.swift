//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Ahmed Amin on 01/11/2022.
//

import Foundation
import Combine


final class TransactionListViewModel: ObservableObject {
    //MARK: - Variables
    @Published private var transactions: [Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    //MARK: - Init
    init() {
        getTransactions()
    }
    
    //MARK: - Api Calling
    func getTransactions() {
        
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalid Date")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching transactions:", error.localizedDescription)
                case .finished:
                    print("Finished fetching transactions")
                }
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self.transactions = result
                dump(self.transactions)
            }
            .store(in: &cancellables)
        
    }
}
