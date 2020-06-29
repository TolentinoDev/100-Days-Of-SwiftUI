//
//  ContentView.swift
//  day-35
//
//  Created by Ryan Tolentino on 6/28/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var inGameMode = false
    @State var gameOver = false
    
    
    @State private var quizLength = 0
    @State private var difficultyLevel = 1
    @State private var options = [1,2,3,4,5,6,7,8,9,10,11,12]
    @State var quizLengthIndex = 0
    
    let quizLengths =  [5,10,20,100]
    
    
    var body: some View {
        NavigationView {
            VStack {
            if !inGameMode{
                Group {
                    Stepper(value: $difficultyLevel, in: 1...12, step: 1){
                        Text("Times tables up to: \(difficultyLevel)")}
                    Picker("Quiz Length", selection: $quizLength) {
                        ForEach(0 ..< quizLengths.count) {
                            Text("\(self.quizLengths[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Section{
                        Button(action: {
                            self.inGameMode.toggle()
                        }) {
                            Text("Show details")
                        }

                        }
            }
    }
                
        if inGameMode{
                Group {
                    ForEach(1 ..< quizLengths[quizLength]){number in
                        Text("Question number \(number)")
                    }
                }
            }
            }
    }.navigationBarTitle("Multipication!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

