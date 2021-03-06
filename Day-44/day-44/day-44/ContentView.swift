//
//  ContentView.swift
//  day-44
//
//  Created by Ryan Tolentino on 7/12/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct Flower: Shape{
    var petalOffset:Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from:0, to: CGFloat.pi * 2, by: CGFloat.pi / 8){
            let rotation = CGAffineTransform(rotationAngle: number)
            let postition =
                rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x:CGFloat(petalOffset),y:0,width:CGFloat(petalWidth), height: rect.width / 2))
            let roatedPetal = originalPetal.applying(postition)
            
            path.addPath(roatedPetal)
        }
        return path
    }
}
struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack{
            Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color.red, style: FillStyle(eoFill: true))
            
            Text("Offset")
            Slider(value:$petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
