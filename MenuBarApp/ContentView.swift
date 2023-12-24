//
//  ContentView.swift
//  MenuBarApp
//
//  Created by Pallab Kalita on 24/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm : StockListViewModel
    
    
    init(vm: StockListViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Stocks").padding()
            
            List(vm.stocks, id: \.symbol){ stock in
                HStack(alignment : .center){
                    VStack(alignment: .leading){
                        Text(stock.symbol)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(stock.description)
                            .opacity(0.5)
                    }
                    Spacer()
                    Text(String(stock.price.formatAsCurrency()))
                }
            }.task {
                await vm.populateStocks()
            }
            
        }.frame(width: 300, height: 300)
        .padding()
    }
}

#Preview {
    ContentView(vm: StockListViewModel())
}
