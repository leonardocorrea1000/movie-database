//
//  GenreCollectionViewCell.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let reusableIdentifier = "GenreCollectionViewCell"
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor(hexString: "#707070")
        label.font = UIFont.systemFont(ofSize: 11)
                
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(genreLabel)
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            genreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            genreLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            genreLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
        
        self.backgroundView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.borderColor = UIColor(hexString: "#E1E1E1").cgColor
            view.layer.borderWidth = 2
            return view
        }()
    }
    
    func config(_ genre: Genre) {
        genreLabel.text = genre.name
    }

}
