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
    
}

class ArticlesInteractor: ArticleDataStore {
    public var presenter: ArticlesPresentationLogic!
    public var articles: [ArticleModel] = [] {
        didSet {
            presenter.presentNews(articles: articles)
        }
    }
}
