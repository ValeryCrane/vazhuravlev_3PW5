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
        self.backgroundColor = .systemGray5
        
        let wrapper = UIView()
        wrapper.backgroundColor = .white
        self.contentView.addSubview(wrapper)
        wrapper.pin(to: self.contentView, .top, .left, .right)
        wrapper.pinBottom(to: self.contentView.bottomAnchor, 32)
        wrapper.layer.shadowColor = UIColor.black.cgColor
        wrapper.layer.shadowOpacity = 0.2
        wrapper.layer.shadowOffset = .zero
        wrapper.layer.shadowRadius = 3
        
        wrapper.addSubview(articleImage)
        articleImage.pin(to: wrapper, .left, .top, .right)
        articleImage.setHeight(to: 150)
        articleImage.backgroundColor = .systemGray6
        articleImage.contentMode = .scaleAspectFill
        articleImage.clipsToBounds = true
        
        wrapper.addSubview(titleLabel)
        titleLabel.pinTop(to: articleImage.bottomAnchor, 8)
        titleLabel.pinLeft(to: wrapper.leadingAnchor, 16)
        titleLabel.pinRight(to: wrapper.trailingAnchor, 16)
        titleLabel.font = .systemFont(ofSize: 24, weight: .black)
        
        wrapper.addSubview(descriptionLabel)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, 8)
        descriptionLabel.pinLeft(to: wrapper.leadingAnchor, 16)
        descriptionLabel.pinRight(to: wrapper.trailingAnchor, 16)
        descriptionLabel.pinBottom(to: wrapper.bottomAnchor, 8)
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .light)
        descriptionLabel.numberOfLines = 3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - setup functions
    public func setupText(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    public func setupImage(data: Data?) {
        if let data = data {
            articleImage.image = UIImage(data: data)
        } else {
            articleImage.image = UIImage()
        }
    }
}
