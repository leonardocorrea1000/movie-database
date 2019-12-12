//
//  Movies.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let results: [Movie]
    let page: Int
    let total_pages: Int
    let total_results: Int
}

struct Movie: Decodable {
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String?
    let backdrop_path: String?
    let genre_ids: [Int]
}
