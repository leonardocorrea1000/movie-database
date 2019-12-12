//
//  MovieDetailsVC.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MovieDetailsVC: UIViewController {    
    var movie: Movie!
    private var myView: MovieDetailsView!
    private var genres: [Genre] = []
    
    override func loadView() {
        super.loadView()
        myView = MovieDetailsView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movie.title
        setupViews()        
    }
    
    func setupViews() {
        myView.movieTitle.text = movie.title
        myView.overViewText.text = movie.overview
        
        let date = Date(string: movie.release_date)
        myView.releaseDate.text = "Release date \(date.toDDMMYYY())"
        genres = (GenresDataManager.sharedInstance.genres?.genres.filter{ movie.genre_ids.contains($0.id) })!
        configGenresCollectionView()
        
        if let posterPath = movie.poster_path {
            loadImage(posterPath)
        }
    }
    
    func loadImage(_ imagePath: String) {
        AF.download(APIBase.imageUrl + imagePath).responseData { [weak self] response in
            if let data = response.value {
                self?.myView.bannerImage.image = UIImage(data: data)
            }
        }
    }
    
    func configGenresCollectionView() {
        myView.genresCollectionView.dataSource = self
        myView.genresCollectionView.delegate = self
        
        myView.genresCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.reusableIdentifier)
    }
    
}

extension MovieDetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.reusableIdentifier, for: indexPath) as! GenreCollectionViewCell
        
        cell.config(genres[indexPath.row])
        
        return cell
    }
}

