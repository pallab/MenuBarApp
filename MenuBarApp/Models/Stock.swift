//
//  Stocks.swift
//  MenuBarApp
//
//  Created by Pallab Kalita on 24/12/23.
//

import Foundation


struct Stock: Decodable {
    let ticker : String
    let sentiment : String
    let no_of_comments : Double
}
