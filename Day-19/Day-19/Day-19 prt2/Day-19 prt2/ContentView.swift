//
//  ContentView.swift
//  Day-19 prt2
//
//  Created by Ryan Tolentino on 6/11/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    let lengthUnits: [String] =  ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    let lengthExtensions : [UnitLength] = [.meters, .kilometers, .feet, .yards, .miles]
    
    var convertedValue: Double {
        if let value = Double(inputNumber){
            let initial = Measurement(value: value, unit: lengthUnits[inputUnit])
            return initial.converted(to: lengthUnits[outputUnit]).value
        }
        return 0
    
        }

    
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
