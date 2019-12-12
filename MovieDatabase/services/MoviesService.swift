//
//  MoviesService.swift
//  MovieDatabase
//
//  Created by Leonardo Correa on 10/12/19.
//  Copyright © 2019 Leonardo Correa. All rights reserved.
//

import Foundation
import Alamofire

class MoviesService: NSObject {
    static let sharedInstance = MoviesService()
    
    
    func fetchUpcomingMovies(page: Int, completion: @escaping (_ movies: Movies?)->()) {
        let url = APIBase.baseUrl + APIBase.upcomingMovies + APIBase.keyQuery + "&page=\(page)"
        AF.request(url).responseJSON { response in
            if response.error != nil {
                completion(nil)
                return
            }
            
            let fetchResponse = try! JSONDecoder().decode(Movies.self, from: response.data!)
            completion(fetchResponse)
        }
    }
    
    func fetchGenres(completion: @escaping (_ genres: Genres?) -> ()) {
        AF.request(APIBase.baseUrl + APIBase.genresList + APIBase.keyQuery).responseJSON { response in
            if response.error != nil {
                completion(nil)
                return
            }
            
            let fetchResponse = try! JSONDecoder().decode(Genres.self, from: response.data!)
            completion(fetchResponse)
        }
    }
}
