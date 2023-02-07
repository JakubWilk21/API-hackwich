//
//  ContentView.swift
//  API hackwich
//
//  Created by Jakub Wilk on 2/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var jokes = [Joke]()
    var body: some View {
        NavigationView {
            List(jokes) { joke in
                NavigationLink(destination: Text(joke.punchline)
                    .padding()) {
                        Text(joke.setup)
                    }
            }
            .navigationTitle("Programming Jokes")
        }
        .onAppear() {
            getJokes()
        }
    }
    func getJokes() {
        let apiKey = "?rapidapi-key=1a521986b0msh0ecfd357b9123fbp1ca6cfjsnb7ef71545a5d
        }
}
        struct Joke: Identifiable {
            let id = UUID()
            var setup = ""
            var punchline = ""
        }

 
