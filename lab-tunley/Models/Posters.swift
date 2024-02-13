//
//  Posters.swift
//  lab-tunley
//
//  Created by Ximena on 2/12/24.
//

import Foundation
struct PosterSearchResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: URL
}
