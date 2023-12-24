//
//  Double+Extensions.swift
//  MenuBarApp
//
//  Created by Pallab Kalita on 24/12/23.
//

import Foundation

extension Double {
    func formatAsCurrency() -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? "n/a"
    }
}
