//
//  UsedGames+Formatters.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import Foundation

struct Formatters {
    
    static let dollarformatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.currencyCode = "USD"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}
