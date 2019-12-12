//
//  MovieTableViewCell.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class MovieTableViewCell: UITableViewCell {
    static let reusableIdentifier = "MovieTableViewCell"
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        configViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViews() {
        contentView.addSubview(bannerImage)
        contentView.addSubview(movieTitle)
        contentView.addSubview(releaseDate)
        contentView.addSubview(genresCollectionView)
        
        NSLayoutConstraint.activate([
            bannerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            bannerImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bannerImage.widthAnchor.constraint(equalToConstant: 130),
            bannerImage.heightAnchor.constraint(equalToConstant: 200),
            
            movieTitle.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            movieTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            releaseDate.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            releaseDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            releaseDate.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 10),
            
            genresCollectionView.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 10),
            genresCollectionView.topAnchor.constraint(equalTo: releaseDate.bottomAnchor, constant: 10),
            genresCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            genresCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
    
    func configCell(_ movie: Movie) {
        movieTitle.text = movie.title
        
        let date = Date(string: movie.release_date)
        releaseDate.text = "Release date \(date.toDDMMYYY())"
        genres = (GenresDataManager.sharedInstance.genres?.genres.filter{ movie.genre_ids.contains($0.id) })!
        configGenresCollectionView()
        
        if let posterPath = movie.poster_path {
            loadImage(posterPath)
        }
    }
    
    func loadImage(_ imagePath: String) {
        AF.download(APIBase.imageUrl + imagePath).responseData { [weak self] response in
            if let data = response.value {
                self?.bannerImage.image = UIImage(data: data)
            }
        }
    }
    
    func configGenresCollectionView() {
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        
        genresCollectionView.register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.reusableIdentifier)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bannerImage.image = UIImage(named: "picture-icon")
        genres = []
        genresCollectionView.reloadData()
    }
}

extension MovieTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCollectionViewCell.reusableIdentifier, for: indexPath) as! GenreCollectionViewCell
        
        cell.config(genres[indexPath.row])
        
        return cell
    }
}
