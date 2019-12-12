//
//  Genres.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation


struct Genres: Decodable {
    let genres: [Genre]
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
