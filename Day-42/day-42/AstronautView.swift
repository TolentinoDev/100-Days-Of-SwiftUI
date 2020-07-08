//
//  AstronautView.swift
//  day-41
//
//  Created by Ryan Tolentino on 7/7/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    var body: some View {

        GeometryReader {geometry in
            ScrollView(.vertical){
                VStack{
                    Image(self.astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width)
                    Text("Missions:")
                        .bold()
                    ForEach(self.missions) { mission in
                        HStack{
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width:44,height:44)
                            
                            Text(mission.displayName)
                        }
                    }
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    
                }

            }
        }
            
        .navigationBarTitle(Text(astronaut.name),displayMode: .inline)
    }
    init(astronaut: Astronaut){
        self.astronaut = astronaut
        let missions: [Mission] = Bundle.main.decode("missions.json")
        
        let matches = missions.filter { mission in
                    mission.crew.contains(where: { $0.name == astronaut.id })
                }

                self.missions = matches
            }
        }

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
