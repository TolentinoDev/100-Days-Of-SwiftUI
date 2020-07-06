//
//  ContentView.swift
//  day-40
//
//  Created by Ryan Tolentino on 7/2/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        NavigationView{
            List(missions) { mission in
                NavigationLink(destination: Text(mission.description)){
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:44, height:44)
                    VStack(alignment: .leading){
                    Text(mission.displayName)
                        .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                }
            }
        .navigationBarTitle("Learn About Space")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

