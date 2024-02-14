//
//  PostersViewController.swift
//  lab-tunley
//
//  Created by Ximena on 2/12/24.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Get a collection view cell (based in the identifier you set in storyboard) and cast it to our custom AlbumCell
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

           // Use the indexPath.item to index into the albums array to get the corresponding album
           let posters = posters[indexPath.item]

           // Get the artwork image url
           let imageUrl = posters.poster_path

           // Set the image on the image view of the cell
           Nuke.loadImage(with: imageUrl, into: cell.posterImageView)

           return cell
    }
    
    @IBOutlet weak var postersView: UICollectionView!
    
    var posters: [Poster] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postersView.dataSource = self         // Create a search URL for fetching albums (`entity=album`)
        let url = URL(string: "https://image.tmdb.org/t/p/w500/{posterPath}")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                let posters = response.results
                print(posters)
                DispatchQueue.main.async {
                    self?.posters = posters
                    
                    self?.postersView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        // Do any additional setup after loading the view.
        // Get a reference to the collection view's layout
        // We want to dynamically size the cells for the available space and desired number of columns.
        // NOTE: This collection view scrolls vertically, but collection views can alternatively scroll horizontally.
        let layout = postersView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 4

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 4

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        let width = (postersView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns

        // Set the size that each tem/cell should display at
        layout.itemSize = CGSize(width: width, height: width)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
