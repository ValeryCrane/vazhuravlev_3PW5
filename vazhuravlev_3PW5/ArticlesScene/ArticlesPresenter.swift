//
//  ArticlesPresenter.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit

protocol ArticlesPresentationLogic: AnyObject {
    func presentNews(articles: [ArticleModel])          // Presents news into ArticleCellModel.
    func presentImage(data: Data, newsId: Int)          // Presents image to view.
    func presentConnectionError()                       // Presents connection error on view.
}

class ArticlesPresenter {
    public weak var view: ArticlesDisplayLogic!
}


// MARK: - ArticlesPresentationLogic implementation
extension ArticlesPresenter: ArticlesPresentationLogic {
    func presentNews(articles: [ArticleModel]) {
        // Parsing loaded data.
        let presentedArticles: [ArticleCellModel] = articles.compactMap { article in
            if let articleId = article.newsId,
            let articleTitle = article.title,
               let articleDesctiption = article.announce,
               let articleUrl = article.articleURL {
                return ArticleCellModel(
                    id: articleId,
                    title: articleTitle,
                    description: articleDesctiption,
                    articleUrl: articleUrl,
                    image: nil)
            }
            return nil
        }
        DispatchQueue.main.async { [weak self] in
            self?.view.displayNews(articles: presentedArticles)
        }
    }
    
    func presentImage(data: Data, newsId: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let image = UIImage(data: data) else { return }
            self?.view.displayImage(image: image, newsId: newsId)
        }
    }
    
    func presentConnectionError() {
        DispatchQueue.main.async { [weak self] in
            self?.view.displayConnectionError()
        }
    }
}
