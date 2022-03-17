//
//  WebViewController.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit
import WebKit

// WebView opening url, passed to it.
class WebViewController: UIViewController {
    public var articleUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let webView = WKWebView()
        view.addSubview(webView)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        webView.pin(to: view, .left, .right)
        
        if let articleUrl = self.articleUrl {
            webView.load(URLRequest(url: articleUrl))
        }
    }
}
