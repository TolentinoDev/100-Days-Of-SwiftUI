//
//  ContentView.swift
//  Day-19
//
//  Created by Ryan Tolentino on 6/12/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//
// Volume Conversion users choose milliliters, liters, cups, pints, or gallons.
//A segmented control for meters, kilometers, feet, yard, or miles, for the input unit.
//A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit.
//A text field where users enter a number.
//A text view showing the result of the conversion

import SwiftUI

struct ContentView: View {
    @State private var initialValue = ""
    @State private var conversionUnitInput = 0
    @State private var conversionUnitOutput = 0
    
    let volumeOptions: [String] = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
    let volumeUnits: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    
    
    var convertedValue: Double {
        if let value = Double(initialValue){
            let initial = Measurement(value: value, unit: volumeUnits[conversionUnitInput])
            return initial.converted(to: volumeUnits[conversionUnitOutput]).value
        }
        return 0
    
        }
        
        
        
    
    var body: some View {
        NavigationView{
                Form {
                    Section {
                        TextField("Enter number of \(self.volumeOptions[conversionUnitInput])", text: $initialValue)
                            .keyboardType(.decimalPad)
                    }
                        Section(header: Text("Select your unit")) {
                            Picker("Input Unit", selection: $conversionUnitInput){
                                ForEach(0 ..< volumeOptions.count){
                                    Text("\(self.volumeOptions[$0])")
                                }
                            }
                        .pickerStyle(SegmentedPickerStyle())
                        }
                    
                        Section(header: Text("Convert to")) {
                            Picker("Output Unit", selection: $conversionUnitOutput){
                                ForEach(0 ..< volumeOptions.count){
                                    Text("\(self.volumeOptions[$0])")
                                }
                            }
                        .pickerStyle(SegmentedPickerStyle())
                        }
                    
                        Section(header: Text("Converted")) {
                            Text("\(initialValue) \(self.volumeOptions[conversionUnitInput]) is equal to \(convertedValue, specifier: "%.2f") \(self.volumeOptions[conversionUnitOutput])")
                        }

            }
                }
            .navigationBarTitle("Volume Converter")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
