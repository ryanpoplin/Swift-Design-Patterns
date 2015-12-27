//
//  Album.swift
//  BlueLibrarySwift
//
//  Created by Ryan Poplin on 12/27/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import Foundation

class Album {
    
    // this class is created based on model logic, such as core 'thing' properties, methods, and plans for possible subclassability...
    // and init() values on instantiation...
    
    // MARK: - class properties
    
    let title: String!
    let artist: String!
    let genre: String!
    let coverUrl: String!
    let year: String!
    
    // MARK: - computed properties
    
    var description: String {
        return "title: \(title)" + "artist: \(artist)" + "genre: \(genre)" + "coverUrl: \(coverUrl)" + "year: \(year)"
    }
    
    // MARK: - class methods
    
    init(title: String, artist: String, genre: String, coverUrl: String, year: String) {
        self.title = title
        self.artist = artist
        self.genre = genre
        self.coverUrl = coverUrl
        self.year = year
    }
    
}