//
//  LibraryAPI.swift
//  BlueLibrarySwift
//
//  Created by Ryan Poplin on 12/27/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import Foundation

/*

Singleton Pattern...

The first time a client asks for the sharedInstance, the instance property isn’t yet initialized, so you create a new instance of the class and return a reference to it.
The next time you call sharedInstance, instance is immediately returned without any initialization. This logic ensures that only one instance exists at one time.

*/

// the Facade Pattern

// just subclass NSObject for now...
class LibraryAPI: NSObject {
    
    // Client API Setup
    
    // in Swift, all class or struct properties must be initialized with values before they are instantiated
    private let persistencyManager: PersistencyManager
    private let httpClient: HTTPClient
    // needed???
    private let isOnline: Bool
    
    // MARK: - computed properties
    
    // IOW, 'class' allows you to get something from a class, without an instance of that class
    class var sharedInstance: LibraryAPI {
        
        struct Singleton {
            // static: only exists once in memory...
            // lazy is good here, you only need it when you need it in the app
            // constant property utilized bc it's not going to be set ever again
            static let instance = LibraryAPI()
        }
    
        return Singleton.instance
    
    }
    
    func getAlbums() -> [Album] {
        return persistencyManager.getAlbums()
    }
    
    func addAlbum(album: Album, index: Int) {
        // local data update...
        persistencyManager.addAlbum(album, index: index)
        if isOnline {
            httpClient.postRequest("...", body: album.description)
        }
    }
    
    func deleteAlbum(index: Int) {
        persistencyManager.deleteAlbum(index)
        if isOnline {
            httpClient.postRequest("...", body: "\(index)")
        }
    }
    
    override init() {
        persistencyManager = PersistencyManager()
        httpClient = HTTPClient()
        isOnline = false
        // since we're inheriting from NSObject, we need to init() the properites associated with that class
        super.init()
    }
    
}