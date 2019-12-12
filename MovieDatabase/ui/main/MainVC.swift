//
//  MainVC.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    private var myView: MainView!
    private var movieList: [Movie] = []
    private var page: Int = 1
    private var totalPages: Int = 0
    
    override func loadView() {
        super.loadView()
        myView = MainView()
        self.view = myView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.title = "Upcoming Movies"
                
        fetchUpcomingMovies()
        setupTableView()
    }
    
    private func fetchUpcomingMovies() {
        myView.activityIndicator.startAnimating()
        MoviesService.sharedInstance.fetchUpcomingMovies(page: page) { [weak self] movies in
            guard let wSelf = self else { return }
            wSelf.myView.activityIndicator.stopAnimating()
            
            if let totalPages = movies?.total_pages {
                wSelf.totalPages = totalPages
            }
            
            if let results = movies?.results {
                wSelf.movieList.append(contentsOf: results)
                wSelf.myView.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        myView.tableView.delegate = self
        myView.tableView.dataSource = self
        myView.tableView.contentInsetAdjustmentBehavior = .never
        
        myView.tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reusableIdentifier)
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reusableIdentifier, for: indexPath) as! MovieTableViewCell
        
        cell.configCell(movieList[indexPath.row])
        
        if indexPath.row == movieList.count - 1 {
            page = page + 1
            if page <= totalPages {
                fetchUpcomingMovies()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsVC()
        vc.movie = movieList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
