//
//  ArticlesViewController.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import UIKit


protocol ArticlesDisplayLogic: AnyObject {
    func displayNews(articles: [ArticleCellModel])
}

class ArticlesViewController: UIViewController {
    public var interactor: ArticlesBusinessLogic!
    private var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.pinTop(to: self.view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pin(to: self.view, .left, .right)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
    }
}

extension ArticlesViewController: UITableViewDelegate { }

extension ArticlesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
