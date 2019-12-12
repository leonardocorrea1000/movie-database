//
//  SplashScreenVC.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit

class SplashScreenVC: UIViewController {
    var myView: SplashScreenView!
        
    override func loadView() {
        super.loadView()
        myView = SplashScreenView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGenres()
    }
    
    private func fetchGenres() {
        myView.activityIndicator.startAnimating()
        
        MoviesService.sharedInstance.fetchGenres() { [weak self] genres in
            guard let wSelf = self else { return }
            GenresDataManager.sharedInstance.genres = genres
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
                wSelf.myView.activityIndicator.stopAnimating()
                AppDelegate.shared.rootViewController.switchToMainScreen()
            }
        }
    }
    
}
