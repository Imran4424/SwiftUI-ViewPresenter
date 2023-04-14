//
//  ContentView.swift
//  ViewPresenter
//
//  Created by Shah Md Imran Hossain on 14/4/23.
//

import SwiftUI

// sheet is alernative to showing views modally in UIKit
struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Imran")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Sheet
// sheet is for showing unrelated content modally
//
// settings
// compose window
// trophy list
