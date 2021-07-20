//
//  Model.swift
//  MovieManagerApp
//
//  Created by Mesut Aygün on 20.07.2021.
//

import Foundation


import Foundation

struct  MoviesData : Decodable {
    let movies : [Movie]
    
    private enum CodingKeys : String , CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title : String?
    let posterImage : String?
    let overview : String?
    
    
//    api dosyamızın içinde yazan şekliyle case yaptık
    
    
    private enum CodingKeys : String , CodingKey {
        case title , overview
        case posterImage = "poster_path"
    }
}
