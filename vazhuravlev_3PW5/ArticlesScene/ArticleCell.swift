//
//  ArticleCell.swift
//  vazhuravlev_3PW5
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import Foundation
import UIKit


// Table view cell reprsenting news article.
class ArticleCell: UITableViewCell {
    public static let reuseIdentifier = "ArticleCell"
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let articleImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 3
        
        self.addSubview(articleImage)
        articleImage.pin(to: self, .left, .top, .right)
        articleImage.setHeight(to: 150)
        articleImage.backgroundColor = .systemGray6
        articleImage.contentMode = .scaleAspectFill
        articleImage.clipsToBounds = true
        
        self.addSubview(titleLabel)
        titleLabel.pinTop(to: articleImage.bottomAnchor, 16)
        titleLabel.pinLeft(to: self.leadingAnchor, 24)
        titleLabel.pinRight(to: self.trailingAnchor, 24)
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        self.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, 8)
        descriptionLabel.pinLeft(to: self.leadingAnchor, 24)
        descriptionLabel.pinRight(to: self.trailingAnchor, 23)
        descriptionLabel.pinBottom(to: self.bottomAnchor, 16)
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        descriptionLabel.numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup functions
    public func setupText(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    public func setupImage(image: UIImage?) {
        if let image = image {
            articleImage.layer.removeAllAnimations()
            articleImage.image = image
        } else {
            let animation = CABasicAnimation(keyPath: "backgroundColor")
            animation.fromValue = UIColor.systemGray4.cgColor
            animation.toValue = UIColor.systemGray6.cgColor
            animation.duration = 0.8
            animation.repeatCount = .greatestFiniteMagnitude
            animation.autoreverses = true
            
            articleImage.layer.add(animation, forKey: "backgroundColor")
            
            articleImage.image = UIImage()
        }
    }
}

