//
//  ContentView.swift
//  day-26
//
//  Created by Ryan Tolentino on 6/19/20.
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
    
    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0){
                    Text("When do you want to wake up")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())}
                VStack(alignment: .leading, spacing: 0){
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }
                }
                
                VStack(alignment: .leading, spacing: 0){
                Text("Daily coffee intake")
                    .font(.headline)
                Stepper(value: $coffeeAmount, in: 1...20, step: 1){
                    if coffeeAmount == 1{
                    Text("\(coffeeAmount) cup")
                    } else {
                        Text("\(coffeeAmount) cups")
                    }
                }
            }
                    Button(action: calculateBedtime) {
                        HStack {
                        Spacer()
                        Text("Calculate")
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("BetterRest")
                .alert(isPresented: $showingAlert){
                    Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    // This is a computed property
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
        
    }
        func calculateBedtime() {
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
                
                alertMessage = formatter.string(from: sleepTime)
                alertTitle = "Your ideal bedtime is... "
            } catch {
                alertTitle = "Error"
                alertMessage = "Sorry, there was a problem calculating your bedtime"
            }
            
            showingAlert = true

            
        }
        
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
