/*
* Copyright (c) 2014 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet var dataTable: UITableView!
	@IBOutlet var toolbar: UIToolbar!
	
    private var allAlbums = [Album]()
    private var currentAlbumData: (titles: [String], values: [String])?
    private var currentAlbumIndex = 0
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        navigationController?.navigationBar.translucent = false
        
        currentAlbumIndex = 0
        
        allAlbums = LibraryAPI.sharedInstance.getAlbums()
        
        dataTable.delegate = self
        dataTable.dataSource = self
        dataTable.backgroundView = nil
        view.addSubview(dataTable!)
        
        showDataForAlbum(currentAlbumIndex)
        
		// Do any additional setup after loading the view, typically from a nib.
	}

    func showDataForAlbum(albumIndex: Int) {
    
        if (albumIndex < allAlbums.count && albumIndex > -1) {
            let album = allAlbums[albumIndex]
            currentAlbumData = album.ae_tableRepresentation()
        } else {
            currentAlbumData = nil
        }
        
        dataTable!.reloadData()
    
    }
    
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

// This is how you make your delegate conform to a protocol — think of it as a promise made by the delegate to fulfill the method’s contract. Here, you indicate that ViewController will conform to the UITableViewDataSource and UITableViewDelegate protocols. This way UITableView can be absolutely certain that the required methods are implemented by its delegate.

// ViewController is the data source for our UITableView properties and methods to work with

// MARK: - data source

extension ViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let albumData = currentAlbumData {
            return albumData.titles.count
        } else {
            return 0
        }
    }
}

// MARK: - delegate

// ViewController is the delegate of the UITableView
extension ViewController {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if let albumData = currentAlbumData {
            cell.textLabel!.text = albumData.titles[indexPath.row]
            cell.detailTextLabel!.text = albumData.values[indexPath.row]
        }
        return cell
    }
}