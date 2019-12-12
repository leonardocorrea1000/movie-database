//
//  NetworkService.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation

class APIBase {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let imageUrl = "https://image.tmdb.org/t/p/w200"
    static let apiKey = "c5850ed73901b8d268d0898a8a9d8bff"
    static let keyQuery = "?api_key=\(apiKey)"
    
    static let upcomingMovies = "/movie/upcoming"
    static let genresList = "/genre/movie/list"

}
