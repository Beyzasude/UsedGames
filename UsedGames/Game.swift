//
//  Game.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import Foundation

class Game: NSObject, Identifiable, Codable{
    
    var name: String
    var priceInDollars: Double
    var serialNumber: String
    var dateCreated: Date
    
    //bu init zorunlu bir inittir.
    init(name:String, priceInDollars:Double, serialNumber:String) {
        self.name = name
        self.priceInDollars = priceInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
    
    }
    convenience init(random:Bool = false){
        if random {
            
            let conditions = ["New", "Mint","Used"]
            var idx = arc4random_uniform(UInt32(conditions.count))
            let randomCondition = conditions[Int(idx)]
            
            let names = ["Resident Evil", "Gears Of War", "Halo", "God Of War"]
            idx = arc4random_uniform(UInt32(names.count))
            let randomName = names[Int(idx)]
            
            idx = arc4random_uniform(UInt32(6))
            let randomTitle = "\(randomCondition) \(randomName) \(Int(idx))"
            
            let serialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            let priceInDollars = Double(arc4random_uniform(UInt32(70)))
            
            self.init(name: randomTitle, priceInDollars: priceInDollars, serialNumber: serialNumber )
            
        }else{
            self.init(name: "", priceInDollars: 0, serialNumber: "" )
        }
    }
}
