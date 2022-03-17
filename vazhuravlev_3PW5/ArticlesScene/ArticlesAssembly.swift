//
//  ArticlesAssembly.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit

// Assembles article views.
class ArticlesAssembly {
    func assemble() -> UIViewController {
        let view = ArticlesViewController()
        let interactor = ArticlesInteractor()
        let presenter = ArticlesPresenter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}

