//
//  GameStore.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import Foundation

class GameStore: ObservableObject {
    
    @Published var games: [Game] = [] // ne zaman bir obje değiştiğinde arayüzün değişmesini istersek published çağırılır
    
    init() {}
    
    @discardableResult func createGames() -> Game{
        let game = Game(random: true)
        games.append(game)
        return game
    }
    
    func delete(at indexSet: IndexSet) {
        games.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, to newOffset: Int) {
        games.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func indexSet(for game: Game) -> IndexSet?{
        if let firstIndex = games.firstIndex(of: game){
            return IndexSet(integer: firstIndex)
        }else{
            return nil
        }
    }
    
    func game(at indexSet: IndexSet) -> Game? {
        if let firstIndex = indexSet.first{
            return games[firstIndex]
        }
        return nil
    }
}
