//
//  ContentView.swift
//  day-37
//
//  Created by Ryan Tolentino on 6/30/20.
//  Copyright © 2020 Ryan Tolentino. All rights reserved.
//

import SwiftUI

 //single item of expense
struct ExpenseItem: Identifiable,Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
}

// Class to store an array of all those items.
class Expenses: ObservableObject {
    // Since it's published it will refresh body everytime the view changes
    @Published var items = [ExpenseItem](){
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items)
            {
                UserDefaults.standard.set(encoded,forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items"){
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self,from: items){
                self.items = decoded
                return
            }
        }
        self.items = []
    }
    
}

struct ContentView: View {
    @State private var showingAddExpense = false
    // This will create an instance of our Expenses class
    @ObservedObject var expenses = Expenses()
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }
            .onDelete(perform: removeItems)
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddExpense = true
                }) {
                    Image(systemName: "plus")
            }
            )
        }
    }
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
