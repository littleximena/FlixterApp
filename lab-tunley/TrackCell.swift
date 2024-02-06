//
//  TrackCell.swift
//  lab-tunley
//
//  Created by Ximena on 1/29/24.
//

import UIKit
import Nuke

class TrackCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var original_title: UILabel!
    
    /// Configures the cell's UI for the given track.
    func configure(with movies: Movies) {
        original_title.text = movies.original_title
        overview.text = movies.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movies.poster_path, into: poster_path)
    }
    
}
