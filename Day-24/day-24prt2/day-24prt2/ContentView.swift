//
//  ContentView.swift
//  weSplitDay3
//
//  Created by Ryan Tolentino on 6/11/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var textNumberOfPeople = ""
    @State private var tipPercentage = 2
    @State private var totalAmountRed = false
    //@State private var splitBetween = ""
    
    
    let tipPercentages = [10,15,20,25,0]
    
    
    var totalPerPerson: Double {
        //Calculate the total per person here
        let peopleCount = Double(textNumberOfPeople) ?? 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (amountPerPerson)
    }
    
    var total: Double {
        //Calculate the total per person here
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return (grandTotal)
    }
    
    
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Split between", text: $textNumberOfPeople)
                        .keyboardType(.numberPad)
                    }
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total check amount before split!")) {
                    Text("$\(total, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentage] == 0 ? .red : .black )
                }
                Section(header: Text("Amount per person!")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
        }
            }
        .navigationBarTitle("WeSplit")
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

