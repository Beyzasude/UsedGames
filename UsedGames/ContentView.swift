//
//  ContentView.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    let gameStore = GameStore()
    
    var body: some View {
        List(gameStore.games) { (game) in
            GameListItem(game: game)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GameListItem: View {
    var game :Game
    var numberFormatter: NumberFormatter = Formatters.dollarformatter
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4.0) {
                Text(game.name)
                    .font(.body)
                Text(game.serialNumber)
                    .font(.caption)
                    .foregroundColor(Color(white:0.65))
            }
            Spacer()
            Text(NSNumber(value: game.priceInDollars), formatter: numberFormatter)
                .font(.title2)
                .foregroundColor(game.priceInDollars > 30 ?.blue : .gray)
        }
        .padding(.vertical,6)
    }
}
