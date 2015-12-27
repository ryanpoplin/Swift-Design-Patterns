//
//  AlbumView.swift
//  BlueLibrarySwift
//
//  Created by Ryan Poplin on 12/27/15.
//  Copyright © 2015 Raywenderlich. All rights reserved.
//

import UIKit

class AlbumView: UIView {

    // this class is designed with view logic architecture in mind...
    
    // private b/c no other module of code needs to know about the existence of them...
    // !
    private var coverImage: UIImageView!
    private var indicator: UIActivityIndicatorView!
    
    // MARK: NSCoding...
    
    required init(coder aDecoder: NSCoder) {
        // !
        super.init(coder: aDecoder)!
        commonInit()
    }
    
    init(frame: CGRect, albumCover: String) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = UIColor.blackColor()
        coverImage = UIImageView(frame: CGRect(x: 5, y: 5, width: frame.size.width - 10, height: frame.size.height - 10))
        addSubview(coverImage)
        indicator = UIActivityIndicatorView()
        // var center: CGPoint { get set }
        indicator.center = center
        indicator.activityIndicatorViewStyle = .WhiteLarge
        indicator.startAnimating()
        addSubview(indicator)
    }
    
    func highlightAlbum(didHighlightView: Bool) {
        if didHighlightView == true {
            backgroundColor = UIColor.whiteColor()
        } else {
            backgroundColor = UIColor.blackColor()
        }
    }
    
}