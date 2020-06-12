//
//  ContentView.swift
//  day-20
//
//  Created by Ryan Tolentino on 6/13/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
        LinearGradient(gradient: Gradient(colors:[.white,.black]), startPoint: .top, endPoint: .bottom)
        //RadialGradient(gradient: Gradient(colors: [.blue,.black]), center: .center, startRadius: 20, endRadius: 200)
        //AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.red]), center: .center)
            Button(action: {
                    self.showingAlert = true
            }){
                HStack(spacing: 10){
                    Image(systemName: "pencil").renderingMode(.original)
                    Text("Edit Me").font(.largeTitle)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("You are now in editing mode"), message: Text("Please make your changes"), dismissButton: .default(Text("Hell yeah")))
                }
            }
    }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
