//
//  ContentView.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 4.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameStore = GameStore() //gamestore bir sinyal alırsa bu arayüz kendidini yeniden çizmiş olacak
    @State var gameToDelete :Game?
    
    var body: some View {
        NavigationView{
            List{
                ForEach(gameStore.games) { (game) in
                    NavigationLink(destination:Text(game.name)){
                        GameListItem(game: game)
                    }
                }
                .onDelete(perform: { indexSet in gameStore.delete(at: indexSet)
                    self.gameToDelete = gameStore.game(at: indexSet)
                    
                })
                .onMove(perform: { indices,
                    newOffset in
                    gameStore.move(indices: indices, to: newOffset)
                })
            }
            .listStyle(.plain) //bunu yapmayınca listenşn arkası daha soluk oluyor liste belli oluyor.
            .navigationTitle("USED GAMES")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action:{
                    gameStore.createGames()
            },label:{
                Text("Add")
            }))
            .animation(.easeIn(duration: 2),value: UUID())
            .actionSheet(item: $gameToDelete) { (game)
                -> ActionSheet in
                ActionSheet(title: Text("Are you sure?"), message: Text("You will delete  \(game.name)") , buttons: [
                    .cancel(),.destructive(Text("Delete"), action: {
                        if let indexSet = gameStore.indexSet(for: game){
                            gameStore.delete(at: indexSet)
                        }
                    })
                    
                ])
            }
        }
        .accentColor(.purple)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

