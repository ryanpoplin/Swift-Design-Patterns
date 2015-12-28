//
//  PersistencyManager.swift
//  BlueLibrarySwift
//
//  Created by Ryan Poplin on 12/27/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import Foundation

class PersistencyManager: NSObject {

    // no other class or struct needs to know about this property
    private var albums = [Album]()
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func addAlbum(album: Album, index: Int) {
        if albums.count >= index {
            // the index exists, you can edit the content referenced at its index
            albums.insert(album, atIndex: index)
        } else {
            // or, just add it to the end of the array
            albums.append(album)
        }
    }
    
    func deleteAlbum(index: Int) {
        albums.removeAtIndex(index)
    }
    
    override init() {
        
        // dummy list for now from the API
        
        let album1 = Album(title: "Best of Bowie", artist: "David Bowie", genre: "Pop", coverUrl: "http://www.coversproject.com/static/thumbs/album/album_david%20bowie_best%20of%20bowie.png", year: "1992")
        let album2 = Album(title: "It's My Life", artist: "No Doubt", genre: "Pop", coverUrl: "http://www.coversproject.com/static/thumbs/album/album_no%20doubt_its%20my%20life%20%20bathwater.png", year: "2003")
        
        albums = [album1, album2]
        
    }
    
}