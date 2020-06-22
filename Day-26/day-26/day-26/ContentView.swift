//
//  ContentView.swift
//  day-26
//
//  Created by Ryan Tolentino on 6/19/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var SleepAmount = 8.0
    @ State private var wakeUp = Date()
    var body: some View {
        /*
        Stepper(value: $SleepAmount, in: 4...12,step: 0.25){
            Text("\(SleepAmount, specifier: "%g") hours")}
 */
        Form {
            DatePicker("Please enter a time to wake up", selection: $wakeUp, displayedComponents: .hourAndMinute)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
