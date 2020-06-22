//
//  ContentView.swift
//  day-28
//
//  Created by Ryan Tolentino on 6/21/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var wakeUp = defaultWakeTime
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var sleepingTime: String {
        get {
            return calculateBedtime()
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    Text("When do you want to wake up")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())}
                Section {
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                }
                
                Section(header: Text("Daily coffee intake")
                    .font(.headline)){
                    Picker("How many cups", selection: $coffeeAmount){
                        ForEach(0..<10){
                            if $0 == 0 || $0 > 1 {
                                Text("\($0) cups")
                                }
                             else {
                                Text("\($0) cup")
                            }
                        }
                    }
                }
                Section(header: Text("Your ideal bedtime is")
                    .font(.headline)
                    .fontWeight(.heavy)
                    ){
                    HStack{
                        Spacer()
                        Text("\(sleepingTime)")
                            .font(.largeTitle)
                        Spacer()
                    }
                    }
                }
        }
            .navigationBarTitle("BetterRest")
        }
    
    // This is a computed property
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
        
    }
        func calculateBedtime() -> String {
            // CREATE AN INSTANCE OF SLEEPCALCULATE CLASS
            let model = SleepCalculator()
            
            // Determines what components to look at from the date component
            // NOTE: DATES UNWRAP AS A OPTIONAL
            let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            // Multiply the hour by 60 twice to obtain the seconds
            let hour = (components.hour ?? 0) * 60 * 60
            // Multiply the minute by 60 and you obtain the seconds
            let minute = (components.minute ?? 0) * 60
            
            // Create a do catch block to use the prediction medthod on our model
            do {
                let prediction = try
                // Model requires wake, estimated sleep, and coffee amount
                    // Wake is expressed as the numebr of seconds from midnight, so 8am = 28800 seconds
                model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
                let sleepTime = wakeUp - prediction.actualSleep
                
                let formatter = DateFormatter()
                formatter.timeStyle = .short
                
                return formatter.string(from: sleepTime)
                } catch {
                    return "Sorry, there was a problem calculating your bedtime."
                }
            
        }
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

