//
//  Movie.swift
//  Flix
//
//  Created by William Nguyen on 10/10/18.
//  Copyright © 2018 William Nguyen. All rights reserved.
//

import Foundation

class Movie {
    var title: String!
    var overview: String
    var releaseDate: String
    var posterURL: URL!
    var backdropURL: URL!
    var imdbID: String!
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release date"
        imdbID = dictionary["imdb_id"] as? String ?? "No IMDB ID" //Via external ID
        
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        
        let posterPathString = dictionary["poster_path"] as! String
        posterURL = URL(string: baseURLString + posterPathString)!
        
        if let backdropPathString = dictionary["backdrop_path"] as? String {
            backdropURL = URL(string: baseURLString + backdropPathString)!
        }
    }

    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}

