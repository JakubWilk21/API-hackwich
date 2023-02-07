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
        let apiKey = "?rapidapi-key=1a521986b0msh0ecfd357b9123fbp1ca6cfjsnb7ef71545a5d"
        let query = "https://dad-jokes.p.rapidapi.com/joke/type/programming\(apiKey)"
        if let url = URL(string: query) {
            if let data = try? Data(contentsOf: url) {
                let json = try! JSON(data: data)
                if json["success"] == true {
                    let contents = json["body"].arrayValue
                    for item in contents {
                        let setup = item["setup"].stringValue
                        let punchline = item["punchline"].stringValue
                        let joke = Joke(setup: setup, punchline: punchline)
                        jokes.append(joke)
                    }
                }
            }
            
        }
    }
    struct Joke: Identifiable {
        let id = UUID()
        var setup = ""
        var punchline = ""
    }
    
    
}
