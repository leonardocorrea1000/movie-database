//
//  SplashScreenView.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit

class SplashScreenView: UIView {
    
    let activityIndicator: UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: .whiteLarge)
        act.translatesAutoresizingMaskIntoConstraints = false
        return act
    }()
    
    let logoImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "logo")
        return img
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.primaryColor
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(logoImage)
        addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 150),
            logoImage.heightAnchor.constraint(equalToConstant: 120),
            logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                        
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
}
