//
//  ContentView.swift
//  day-33
//
//  Created by Ryan Tolentino on 6/25/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct CornerRotateModifer: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount),anchor: anchor).clipped()
    }
    
}
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifer(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifer(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var isShowingRed = false

    var body: some View {
        VStack {
            Button("Tap me"){
                withAnimation{
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width:200,height: 200)
                    .transition(.pivot)
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
