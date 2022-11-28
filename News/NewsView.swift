//
//  NewsView.swift
//  News
//
//  Created by Ram Balaji Koppula on 28/11/22.
//

import SwiftUI
import SafariServices

struct NewsView: View {
    
    var news: APIResponse
    
    var body: some View {
        List(news.articles, id: \.title){ article in
            NewsRowView(article: article)
        }
    }
}

/*struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}*/
