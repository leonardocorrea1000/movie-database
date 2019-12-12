//
//  MovieDetailsView.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
    private var genres: [Genre] = []
    
    let bannerImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "picture-icon")
        return img
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(hexString: "#707070")
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let genresCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = CGSize(width: 50, height: 21)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    let overViewTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Overview"
        return label
    }()
    
    let overViewText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hexString: "#707070")
        label.numberOfLines = 0
        return label
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.primaryColor
        configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        addSubview(contentView)
        contentView.addSubview(bannerImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(releaseDate)
        contentView.addSubview(genresCollectionView)
        contentView.addSubview(overViewTitle)
        contentView.addSubview(overViewText)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
                        
            bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImage.widthAnchor.constraint(equalToConstant: 130),
            bannerImage.heightAnchor.constraint(equalToConstant: 200),
            
            movieTitle.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            releaseDate.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            releaseDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10),
            
            genresCollectionView.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            genresCollectionView.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 10),
            genresCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            genresCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            overViewTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            overViewTitle.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 20),
            overViewTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            overViewText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            overViewText.topAnchor.constraint(equalTo: overViewTitle.bottomAnchor, constant: 20),
            overViewText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
}
