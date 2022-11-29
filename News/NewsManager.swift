//
//  NewsManager.swift
//  News
//
//  Created by Ram Balaji Koppula on 28/11/22.
//

import Foundation

class NewsManager {
    func getCurrentNews() async throws -> APIResponse {
        
        let API_KEY = "6f9a024b451f41a7a438cb191016936b"
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=\(API_KEY)") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(APIResponse.self, from: data)
        
        return decodedData
    }
}

struct APIResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Decodable {
    let name: String
}
