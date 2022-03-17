//
//  ArticleCellModel.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit

// Presented (result of func presentArticles) model.
struct ArticleCellModel {
    let id: Int
    let title: String
    let description: String
    let articleUrl: URL
    var image: UIImage?
}
