//
//  ContentView.swift
//  day-46
//
//  Created by Ryan Tolentino on 7/20/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI


struct Arrow: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 3 , y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX / 1.5, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
        
    }
}

struct ContentView: View {
    @State private var lineWidth = 5.0
    @State private var isShowingBoldLine = false
    
    var body: some View {
        NavigationView{
            VStack{
                Arrow()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: CGFloat(self.isShowingBoldLine ? 20.0 : self.lineWidth), lineCap: .round, lineJoin: .round))
                    
                    .frame(width: 150, height:350)
                    .onTapGesture {
                    withAnimation{
                        self.isShowingBoldLine.toggle()
                    }
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
