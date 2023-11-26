//
//  PlayerViewModel.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import Foundation

class PlayerViewModel: ObservableObject {
    
    let model: MusicModel
    
    @Published var liked = true
    @Published var slider: Double = 30
    @Published var isPlaying = true
    
    init(model: MusicModel) {
        self.model = model
    }
}
