//
//  GameStore.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import Foundation

class GameStore{
    
    var games: [Game] = []
    
    init(){
        
        for _ in 0..<5{
            createGames()
        }
    }
    
    @discardableResult func createGames() -> Game{
        
        let game = Game(random: true)
        games.append(game)
        return game
    }
}
