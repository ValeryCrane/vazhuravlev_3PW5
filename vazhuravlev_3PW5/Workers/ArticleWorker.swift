//
//  ArticleWorker.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation

class ArticleWorker {
    public weak var delegate: ArticleDataStore?
    
    func fetchNews() {
        guard let url = getURL(rubric: 4, pageIndex: 1) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, responce, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                var articlePage = try? JSONDecoder().decode(ArticlePage.self, from: data)
                articlePage?.passTheRequestId()
                if let news = articlePage?.news {
                    self?.delegate?.articles = news
                }
            }
        }.resume()
    }
    
    private func getURL(rubric: Int, pageIndex: Int) -> URL? {
        return URL(string:
                    "https://news.myseldon.com/api/Section?rubricId=\(rubric)&pageSize=8&pageIndex=\(pageIndex)")
    }
}
