//
//  ContentView.swift
//  ViewPresenter
//
//  Created by Shah Md Imran Hossain on 14/4/23.
//

import SwiftUI

// sheet is alernative to showing views modally in UIKit
struct ModalView: View {
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

struct Person: Identifiable {
    var id = UUID()
    var name: String
}

struct PersonListView: View {
    let people = [
        Person(name: "Soudha"),
        Person(name: "Arongka"),
        Person(name: "Imran"),
        Person(name: "Anik"),
        Person(name: "Nayeem"),
        Person(name: "Linkon"),
        Person(name: "Munir"),
        Person(name: "Rakib"),
        Person(name: "Horidas(Harry)")
    ]
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedPerson: Person?

    var body: some View {
        VStack {
            List(people) { person in
                Button(action: {
                    selectedPerson = person
                }) {
                    Text(person.name)
                }
            }
            
            Spacer()
            
            Button("Dismiss") {
                dismiss()
            }
        }
        .fullScreenCover(item: $selectedPerson) { person in
            PersonDetailView(person: person)
        }
    }
}

struct PersonDetailView: View {
    @Environment(\.dismiss) var dismiss
    let person: Person

    var body: some View {
        VStack {
            Spacer()
            Text(person.name)
                .font(.title)
            
            Spacer()
            
            Button("Dismiss") {
                dismiss()
            }
        }
        .padding()
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    @State private var showingFullScreen = false
    @State private var showingPerson = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Show Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                ModalView(name: "Imran")
            }
            
            Button("Show in fullscreen") {
                showingFullScreen.toggle()
            }
            .fullScreenCover(isPresented: $showingFullScreen) {
                ModalView(name: "Imran in fullscreen")
            }
            
            Button("Show in fullscreen Item") {
                showingPerson.toggle()
            }
            .fullScreenCover(isPresented: $showingPerson) {
                PersonListView()
            }
            
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
