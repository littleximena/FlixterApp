import Foundation

// TODO: Pt 1 - Create a Track model struct

struct MoviesResponse: Decodable {
    let results: [Movie]
}


struct Movie: Decodable {
    let original_title: String
    let overview: String
    let poster_path: String
    
    // Detail properties
    //let details: String
    //let popularity: Double
    //let release_Date: Date
}
// TODO: Pt 1 - Create an extension with a mock tracks static var
/*extension Movie {

    /// An array of mock tracks
    static var mockMovies: [Movie]  = [
        Movie(original_title: "Wonka",
               overview: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
               poster_path: URL(string:"https://m.media-amazon.com/images/M/MV5BNzJiZGRkMDgtZWFlOS00MWRhLThhNTEtMjljZTJjYTljYTBjXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg")!,
             details: "Willy Wonka – chock-full of ideas and determined to change the world one delectable bite at a time – is proof that the best things in life begin with a dream, and if you’re lucky enough to meet Willy Wonka, anything is possible.",
               popularity: 2244.452,
              release_Date: Date()),
        Movie(original_title: "Aquaman and the Lost Kingdom",
               overview: "Black Manta seeks revenge on Aquaman for his father's death. Wielding the Black Trident's power, he becomes a formidable foe. To defend Atlantis, Aquaman forges an alliance with his imprisoned brother. They must protect the kingdom.",
               poster_path: URL(string: "https://m.media-amazon.com/images/M/MV5BMTkxM2FiYjctYjliYy00NjY2LWFmOTEtMWZiYWRjNjA4MGYxXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg")!,
              details: "Black Manta seeks revenge on Aquaman for his father's death. Wielding the Black Trident's power, he becomes a formidable foe. To defend Atlantis, Aquaman forges an alliance with his imprisoned brother. They must protect the kingdom.",
               popularity: 1831.771,
               release_Date: Date()),
        Movie(original_title: "The Beekeeper",
               overview: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
               poster_path: URL(string: "https://m.media-amazon.com/images/M/MV5BZjQwYjU3OTYtMWVhMi00N2Y2LWEzMDgtMzViN2U4NWI1NmI3XkEyXkFqcGdeQXVyODk2NDQ3MTA@._V1_FMjpg_UX1000_.jpg")!,
              details: "One man’s campaign for vengeance takes on national stakes after he is revealed to be a former operative of a powerful and clandestine organization known as Beekeepers.",
               popularity: 2486.901,
               release_Date: Date()),
        Movie(original_title: "Migration",
               overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
               poster_path: URL(string: "https://m.media-amazon.com/images/M/MV5BYTIxZDM5YWItM2Y1My00ODg5LTkzNjAtMWFlZTNlODg0MzEyXkEyXkFqcGdeQXVyMTA5ODEyNTc5._V1_FMjpg_UX1000_.jpg")!,
              details: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
               popularity: 1736.027,
               release_Date: Date()),
        Movie(original_title: "Badland Hunters",
               overview: "After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.",
               poster_path: URL(string: "https://m.media-amazon.com/images/M/MV5BODZiMmM2ZDctYmFjNi00ZDczLTlhMzAtMDBiMzY1MTRlOGFkXkEyXkFqcGdeQXVyMTEzMTI1Mjk3._V1_FMjpg_UX1000_.jpg")!,
              details: "After a deadly earthquake turns Seoul into a lawless badland, a fearless huntsman springs into action to rescue a teenager abducted by a mad doctor.",
               popularity: 1704.65,
               release_Date: Date())
    ]
    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}*/
// MARK: Helper Methods
/// Converts milliseconds to mm:ss format
///  ex:  208643 -> "3:28"
///  ex:
func formattedTrackDuration(with milliseconds: Int) -> String {
    let (minutes, seconds) = milliseconds.quotientAndRemainder(dividingBy: 60 * 1000)
    let truncatedSeconds = seconds / 1000
    if truncatedSeconds >= 10 {
        return "\(minutes):\(truncatedSeconds)"
    } else {
        return "\(minutes):0\(truncatedSeconds)"
    }
}
