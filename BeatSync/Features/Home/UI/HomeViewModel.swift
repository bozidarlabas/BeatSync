//
//  HomeViewModel.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published private(set) var headerStr = "BeatSync"
    @Published private(set) var playlists = [MusicModel]()
    @Published private(set) var recentlyPlayed = [MusicModel]()
    
    @Published private(set) var selectedMusic: MusicModel? = nil
    @Published var displayPlayer = false
    
    init() {
        fetchPlaylist()
        fetchRecentlyPlayed()
    }
    
    private func fetchPlaylist() {
        playlists = MockData.getPlaylists()
    }
    
    private func fetchRecentlyPlayed() {
        recentlyPlayed = MockData.getRecentlyPlayed()
    }
    
    func selectMusic(music: MusicModel) {
        selectedMusic = music
        displayPlayer = true
    }
}
