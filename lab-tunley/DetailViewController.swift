//
//  DetailViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/5/22.
//
import UIKit
import Nuke

class DetailViewController: UIViewController {
    
    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var original_title: UILabel!
    
    @IBOutlet weak var overview: UILabel!
    
    // TODO: Pt 1 - Add a track property
    // A property to store the track object.
    // We can set this property by passing along the track object associated with the track the user tapped in the table view.
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let posterURL = URL(string:"https://image.tmdb.org/t/p/w500\(movie.poster_path)")!
        // Load the image located at the `artworkUrl100` URL and set it on the image view.
        Nuke.loadImage(with: posterURL, into: poster_path)
        
        // Set labels with the associated track values.
        original_title.text = movie.original_title
        //details.text = movie.details
        overview.text = movie.overview
        // Create a date formatter to style our date and convert it to a string
        
        // Use helper method to convert milliseconds into `mm:ss` string format
        
    }


        // TODO: Pt 1 - Configure the UI elements with the passed in track


    }
