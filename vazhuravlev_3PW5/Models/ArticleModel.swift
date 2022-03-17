//
//  ArticleModel.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation

struct ArticleModel {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageModel?
    var requestId: String?
    
    var articleURL: URL? {
        if let requestId = self.requestId, let newsId = self.newsId {
            return URL(string:
                        "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
        }
        return nil
    }
}

struct ImageModel {
    var url: URL?
}
