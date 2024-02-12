

import UIKit
import Nuke

class TrackCell: UITableViewCell {
    
    
    @IBOutlet weak var overview: UILabel!
    
    @IBOutlet weak var poster_path: UIImageView!
    @IBOutlet weak var original_title: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

    
    /// Configures the cell's UI for the given track.
    func configure(with movie: Movie) {
        original_title.text = movie.original_title
        overview.text = movie.overview

        // Load image async via Nuke library image loading helper method
        Nuke.loadImage(with: movie.poster_path, into: poster_path)
    }
    
}
