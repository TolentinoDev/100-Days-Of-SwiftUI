//
//  ContentView.swift
//  day-24
//
//  Created by Ryan Tolentino on 6/17/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct prominentTitles: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
extension View {
    func prominentTitlesStyle() -> some View{
        self.modifier(prominentTitles())
    }
}
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
        .prominentTitlesStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
