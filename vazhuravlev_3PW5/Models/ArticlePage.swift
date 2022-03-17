//
//  ArticlePage.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation

struct ArticlePage: Decodable {
    var news: [ArticleModel]?
    var requestId: String?
    
    mutating func passTheRequestId() {
        for i in 0..<(news?.count ?? 0) {
            news?[i].requestId = self.requestId
        }
    }
}
