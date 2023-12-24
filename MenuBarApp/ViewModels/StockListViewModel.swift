//
//  StockListViewModel.swift
//  MenuBarApp
//
//  Created by Pallab Kalita on 24/12/23.
//

import Foundation

@MainActor
class StockListViewModel: ObservableObject {
    
    @Published var stocks : [StockViewModel] = []
    
    func populateStocks() async {
        
        do {
            let stocks = try await Webservice().getStocks(url: Constants.Urls.latestStocks)
            self.stocks = stocks.map(StockViewModel.init)
        } catch {
            print(error)
        }
    }
}


struct StockViewModel {
    private var stock : Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    var symbol : String {
        stock.ticker
    }
    
    var price : Double {
        stock.no_of_comments
    }
    
    var description : String {
        stock.sentiment
    }
}
