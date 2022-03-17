//
//  ArticlesPresenter.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation


protocol ArticlesPresentationLogic: AnyObject {
    func presentNews(articles: [ArticleModel])
}

class ArticlesPresenter {
    public weak var view: ArticlesDisplayLogic!
    
}


// MARK: - ArticlesPresentationLogic implementation
extension ArticlesPresenter: ArticlesPresentationLogic {
    func presentNews(articles: [ArticleModel]) {
        print(articles)
    }
}
