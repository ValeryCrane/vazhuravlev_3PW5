//
//  ArticlesInteractor.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation

protocol ArticleDataStore: AnyObject {
    var articles: [ArticleModel] { get set }
}

protocol ArticlesBusinessLogic: AnyObject {
    func fetchNews()                            // Fetches news from ArticleWorker
}

class ArticlesInteractor: ArticleDataStore {
    public var presenter: ArticlesPresentationLogic!
    private var worker = ArticleWorker()
    
    public var articles: [ArticleModel] = [] {
        didSet {
            presenter.presentNews(articles: articles)
            
            // Loading images.
            for article in articles {
                DispatchQueue.global().async { [weak self] in
                    let imageData = self?.loadImage(url: article.img?.url)
                    if let imageData = imageData, let newsId = article.newsId {
                        self?.presenter.presentImage(data: imageData, newsId: newsId)
                    }
                }
            }
        }
    }
    
    init() {
        worker.delegate = self
    }
    
    // Loads image from URL.
    private func loadImage(url: URL?) -> Data? {
        if let url = url {
            return try? Data(contentsOf: url)
        }
        return nil
    }
}


// MARK: - ArticlesBusinessLogic implementation
extension ArticlesInteractor: ArticlesBusinessLogic {
    func fetchNews() {
        worker.fetchNews()
    }
}
