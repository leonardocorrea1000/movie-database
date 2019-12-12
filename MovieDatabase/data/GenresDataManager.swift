//
//  GenresDataManager.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 11/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation

class GenresDataManager: NSObject {
    static let sharedInstance = GenresDataManager()
    var genres: Genres?
    
    override init() {
        super.init()
    }
        
}
