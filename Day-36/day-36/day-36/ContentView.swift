//
//  ContentView.swift
//  day-36
//
//  Created by Ryan Tolentino on 6/29/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var name: String
    var body: some View{
        VStack{
        Text("Hello \(name)!")
        Button("Dismiss"){
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    }
    
}

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}


struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    @State private var showingSheet = false
    @ObservedObject private var user = User()
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                .onDelete(perform: removeRows)
                }
                Button("Add Numbers: \(tapCount)") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                    self.tapCount += 1
                    UserDefaults.standard.set(self.tapCount, forKey: "Tap")
                }
                Text("Your name is \(user.firstName) \(user.lastName).")
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
                Button("Show Sheet"){
                    self.showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet){
                    SecondView(name: "@TolentinoDev")
                }
            }
            .navigationBarItems(leading: EditButton())
        }
    }
    func removeRows(at offsets: IndexSet){
        numbers.remove(atOffsets:offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
