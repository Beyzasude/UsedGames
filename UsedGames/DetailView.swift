//
//  DetailView.swift
//  UsedGames
//
//  Created by Beyza Sude Erol on 5.04.2023.
//
import UIKit
import SwiftUI
import Combine
//just publisherı name her değiştiğinde bunu günceller ve bunun için combine framework improt ederiz.

struct DetailView: View {
    
    var game: Game
    var gameStore: GameStore
    @State var name:String = ""
    @State var price:Double = 0.0
    @State var shouldDisableSaveButton: Bool = true
    @State var isPhotoPickerPresenting: Bool = false
    @State var selectedPhoto: UIImage?
    
    func validate(){
        shouldDisableSaveButton = game.name != name || game.priceInDollars != price
    }
    
    var body: some View {
        Form{
            Section{
                VStack(alignment: .leading){
                    Text("Name")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Name", text: $name )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onReceive(Just(name), perform:{ newValue in
                            validate()
                        })
                }
                .padding(.vertical,4.0)
                
                VStack(alignment: .leading){
                    Text("Price in Dollars")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Price", value: $price, formatter: Formatters.dollarformatter)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onReceive(Just(price)) { newValue in
                            validate()
                        }
                }
                .padding(.vertical,4.0)
            }
            Section{
                Button(action: {
                    
                    let  newGame = Game(name: name, priceInDollars: price, serialNumber: game.serialNumber)
                    gameStore.update(game: game, newValue: newGame)
                    
                }, label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .frame(height: 50.0)
                })
                .disabled(!shouldDisableSaveButton)
            }
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar){
                Button(action: {
                    isPhotoPickerPresenting = true
                } , label: {
                    Image(systemName: "camera")
                })
            }
        }
        .navigationBarTitleDisplayMode(.inline) //bunu verdik çünkü detay sayfasına gidince bir önceki sayfadaki bar kısmı olan yerin boşluğu burada da kalıyordu ve sayfa biraz aşağıdan başlıyordu.
        .sheet(isPresented: $isPhotoPickerPresenting, content: {
            PhotoPicker(selectedPhoto: $selectedPhoto)
        })
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let gameStore = GameStore()
        let game = gameStore.createGames()
        
        DetailView(game: game, gameStore: gameStore)
    }
}
