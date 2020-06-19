//
//  ContentView.swift
//  day-25
//
//  Created by Ryan Tolentino on 6/18/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingWinOrLoss = false
    @State private var gameResult = ""
    @State private var gamesRemaining = 10
    @State private var userChoice = 2
    @State private var computerChoice = Int.random(in: 0...2)
    @State private var gameStates = ["Rock","Paper","Scissors"]
    @State private var score = 0
    
    var body: some View {
        ZStack {
            VStack(spacing:10){
                Spacer()
        Text("Rock,Paper,Scissors,Shoot!")
        Text("You have \(gamesRemaining) games remaining")
                Spacer()
                HStack(spacing:10){
                    ForEach(0 ..< gameStates.count){ number in
                        Button(action:{
                            self.buttonTapped(number)
                        }){
                            Text("\(self.gameStates[number])")
                        }
                }
            }
                            Text("Your score is \(score)")
                Spacer()
    }
        }
        .alert(isPresented: $showingWinOrLoss) {
            Alert(title: Text(gameResult), message: Text("You chose \(self.gameStates[userChoice]) The computer chose \(self.gameStates[computerChoice])"), dismissButton: .default(Text("Play again")){
                self.newGame()
                })
        }
    }
func buttonTapped(_ number: Int){
    userChoice = number
    if number == computerChoice {
        gameResult = "Tie!"
        gamesRemaining -= 1
    } else if number == 0 && computerChoice == 2 {
        gameResult = "Win!"
        gamesRemaining -= 1
        score += 1
    }  else if number == 1 && computerChoice == 2 {
           gameResult = "Lose!"
           gamesRemaining -= 1
           score -= 1
    } else if number == 2 && computerChoice == 0 {
           gameResult = "Lose!"
           gamesRemaining -= 1
           score -= 1
    } else if number == 2 && computerChoice == 1 {
        gameResult = "Win!"
        gamesRemaining -= 1
        score += 1
    } else if number == 0 && computerChoice == 1 {
        gameResult = "Lose!"
        gamesRemaining -= 1
        score -= 1
    } else if number == 1 && computerChoice == 0 {
               gameResult = "Win!"
               gamesRemaining -= 1
               score += 1
    } else{
        gameResult = "Error"
    }
    showingWinOrLoss = true
    }
    func newGame() {
        userChoice = 2
        computerChoice = Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

