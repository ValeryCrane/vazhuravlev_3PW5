//
//  ArticlesRouter.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit

protocol ArticlesRoutingLogic: AnyObject {
    func routeToWebView(url: URL)               // Routes to webview with given URL.
}

class ArticlesRouter {
    public weak var view: UIViewController!
}

// MARK: - ArticlesRoutingLogic implementation
extension ArticlesRouter: ArticlesRoutingLogic {
    func routeToWebView(url: URL) {
        let webViewController = WebViewController()
        webViewController.articleUrl = url
        webViewController.title = "Article"
        view.navigationController?.pushViewController(webViewController, animated: true)
    }
}
