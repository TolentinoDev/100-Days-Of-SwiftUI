//
//  ContentView.swift
//  day-47
//
//  Created by Ryan Tolentino on 7/22/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //ObeservedObjects work with classes
    @ObservedObject var activities = Activities()
    
    @State private var showingAddActivity = false
    var body: some View {
        NavigationView{
        List {
                        ForEach(activities.items) { item in
                            NavigationLink(destination: DetailActivityView(activities: self.activities, activity: item)) {
                                Text(item.title)
                                    .font(.headline)
                                Text("\(item.completed)")
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    .navigationBarTitle("Activities")
                    .navigationBarItems(
                        leading: EditButton(),
                        trailing:
                            Button(action: {
                                self.showingAddActivity = true
                            }) {
                                Image(systemName: "plus")
                            }
                    )
                    .sheet(isPresented: $showingAddActivity) {
                        AddActivityView(activities: self.activities)
                    }
                }
    }
            
            func removeItems(at offsets: IndexSet) {
                activities.items.remove(atOffsets: offsets)
            }
        }

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
