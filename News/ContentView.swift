//
//  ContentView.swift
//  News
//
//  Created by Ram Balaji Koppula on 28/11/22.
//

import SwiftUI

struct ContentView: View {
    
    var newsManager = NewsManager()
    @State var news: APIResponse?
    
    var body: some View {
        TabView {
            NavigationView {
                if let news = news {
                    NewsView(news: news)
                        .navigationTitle("News")
                }
                else {
                    ProgressView()
                        .task {
                            do {
                                news = try await newsManager.getCurrentNews()
                            }
                            catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            }
            .tabItem {
                Label("Discover", systemImage: "wand.and.rays")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
