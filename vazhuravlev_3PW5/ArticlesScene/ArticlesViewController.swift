//
//  ArticlesViewController.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import UIKit


protocol ArticlesDisplayLogic: AnyObject {
    func displayNews(articles: [ArticleCellModel])      // Displays news with titles and descriptions.
    func displayImage(data: Data, newsId: Int)          // Displays image for news id.
}

class ArticlesViewController: UIViewController {
    public var interactor: ArticlesBusinessLogic!
    
    private var tableView: UITableView?
    private var articles: [ArticleCellModel] = [] {
        didSet {
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "News"
        self.view.backgroundColor = .white
        setupTableView()
        interactor.fetchNews()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGray5
        self.view.addSubview(tableView)
        tableView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pin(to: self.view, .left, .right)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseIdentifier)
        
        self.tableView = tableView
    }
}


// MARK: - UITableViewDelegate & DataSource implementation
extension ArticlesViewController: UITableViewDelegate { }

extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ArticleCell.reuseIdentifier) as? ArticleCell
        cell?.setupText(title: articles[indexPath.row].title,
                        description: articles[indexPath.row].description)
        cell?.setupImage(data: articles[indexPath.row].image)
        return cell ?? UITableViewCell()
    }
}


// MARK: - ArticlesDisplayLogic implementation
extension ArticlesViewController: ArticlesDisplayLogic {
    func displayNews(articles: [ArticleCellModel]) {
        self.articles = articles
    }
    
    func displayImage(data: Data, newsId: Int) {
        for i in 0..<articles.count {
            if articles[i].id == newsId {
                articles[i].image = data
            }
        }
    }
}
