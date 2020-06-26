//
//  ContentView.swift
//  day-34
//
//  Created by Ryan Tolentino on 6/26/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var image : String
    var body: some View{
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule()
            .stroke(Color.black,lineWidth: 2))
            .shadow(color: .black, radius: 2)
        
    }
}

struct header: View{
    var headerTitle : String
    var headerTitle2 : String
    var body: some View {
        VStack{
        Text(headerTitle)
            .foregroundColor(.white)
        Text(headerTitle2)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }
            
    }
}

struct scoreLabel: View{
    var score : String
    var body: some View {
        Text(score)
            .foregroundColor(.black)
            .fontWeight(.black)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia","France", "Germany", "Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var animationAmount = 0.0
    @State private var opacityAmount = 1.0
    //Determines whether the alert is showing or not
    @State private var showingScore = false
    //Stores the title of what the alert will say
    @State private var scoreTitle = ""
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.black,.blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                    header(headerTitle: "Tap the Flag of", headerTitle2: countries[correctAnswer])
                
                ForEach(0 ..< 3) {number in
                    Button(action:{
                        if number == self.correctAnswer {
                        withAnimation {
                            self.animationAmount += 360
                            self.isShowingRed.toggle()
                            
                        }
                    }
                        self.flagTapped(number)
                        self.opacityAmount = 0.25
                    })
                    {
                        FlagImage(image: self.countries[number])

                    }
                    .opacity(number == self.correctAnswer ? 1 : self.opacityAmount)
                    .rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount: 0), axis: (x: 0, y: 1, z: 0))
                    .background(number != self.correctAnswer && self.isShowingRed ? Color.red : Color.clear)
                }
                scoreLabel(score: "Your score is: \(score)")
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer{
            scoreTitle = "Correct!"
            score += 1
            animationAmount += 360
        } else{
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }
        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in:0...2)
        self.opacityAmount = 1.0
        animationAmount = 0
        isShowingRed = false
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
