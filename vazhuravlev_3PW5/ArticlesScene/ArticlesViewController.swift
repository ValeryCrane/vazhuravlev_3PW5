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
    public var router: ArticlesRoutingLogic!
    
    private var tableView: UITableView?
    private var articles: [ArticleCellModel] = []

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
extension ArticlesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        router.routeToWebView(url: articles[indexPath.section].articleUrl)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Share")
        { [weak self] _,_, completionHandler in
            if let articleUrl = self?.articles[indexPath.section].articleUrl {
                self?.router.routeToShareSheet(url: articleUrl)
            }
            completionHandler(true)
        }
        action.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.4, alpha: 1)
        return UISwipeActionsConfiguration(actions: [action])
    }
}

extension ArticlesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ArticleCell.reuseIdentifier) as? ArticleCell
        cell?.setupText(title: articles[indexPath.section].title,
                        description: articles[indexPath.section].description)
        cell?.setupImage(data: articles[indexPath.section].image)
        return cell ?? UITableViewCell()
    }
}


// MARK: - ArticlesDisplayLogic implementation
extension ArticlesViewController: ArticlesDisplayLogic {
    func displayNews(articles: [ArticleCellModel]) {
        self.articles = articles
        self.tableView?.reloadData()
    }
    
    func displayImage(data: Data, newsId: Int) {
        for i in 0..<articles.count {
            if articles[i].id == newsId {
                articles[i].image = data
                self.tableView?.reloadRows(at: [IndexPath(row: 0, section: i)],
                                           with: UITableView.RowAnimation.automatic)
            }
        }
    }
}
