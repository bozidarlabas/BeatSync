import SwiftUI

struct MockData {
    
    static let Favorite = MusicModel(name: "Lego House", artistName: "Ed Sheeran", coverImage: Image.cover3)
    
    static func getPlaylists() -> [MusicModel] {
        return [
            MusicModel(name: "21", artistName: "Adele", coverImage: Image.cover5),
            MusicModel(name: "Back to Black", artistName: "Amy Winehouse", coverImage: Image.cover1),
            MusicModel(name: "Bad guy", artistName: "Billie Eilish", coverImage: Image.cover2),
            MusicModel(name: "Genesis", artistName: "Dua Lipa", coverImage: Image.cover4),
            MusicModel(name: "The A Team", artistName: "Ed Sheeran", coverImage: Image.cover3)
        ]
    }
    
    static func getRecentlyPlayed() -> [MusicModel] {
        return [
            MusicModel(name: "Be the One", artistName: "Dua Lipa", coverImage: Image.cover4),
            MusicModel(name: "Small Bump", artistName: "Ed Sheeran", coverImage: Image.cover3),
            MusicModel(name: "Listen before i go", artistName: "Billie Eilish", coverImage: Image.cover2),
            MusicModel(name: "Rolling in the Deep", artistName: "Adele", coverImage: Image.cover5),
            MusicModel(name: "Rehab", artistName: "Amy Winehouse", coverImage: Image.cover1)
        ]
    }
}
