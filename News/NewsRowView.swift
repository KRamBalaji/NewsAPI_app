//
//  NewsRowView.swift
//  News
//
//  Created by Ram Balaji Koppula on 28/11/22.
//

import SwiftUI

struct NewsRowView: View {
    
    var article: Article
    let image_not_found = "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg"
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.urlToImage ?? image_not_found)) {
                image in
                image
                    .resizable()
                    .frame(width: 120, height: 118)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(.headline, design: .rounded))
                    .lineLimit(3)
                Text(article.description ?? "no description found")
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
        }
    }
}

/*struct NewsRowView_Previews: PreviewProvider {
    static var previews: some View {
        NewsRowView()
    }
}*/
