//
//  ContentView.swift
//  ViewPresenter
//
//  Created by Shah Md Imran Hossain on 14/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                        .padding()
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// when to use what
// Navigation link
//
// Showing details about something
// List view element details
//
