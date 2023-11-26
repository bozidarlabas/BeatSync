//
//  PlaylistView.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

struct PlaylistView: View {
    
    let name: String, artistName: String, coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            coverImage.resizable().scaledToFill()
                .frame(width: 114, height: 88).cornerRadius(16)
            Text(name).foregroundColor(.textPrimary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12).padding(.bottom, 6)
            Text(artistName).foregroundColor(.textPrimaryF1)
                .modifier(FontModifier(.regular, size: 12))
                .padding(.bottom, 8)
        }
        .padding(12).background(Color.primaryColor)
        .cornerRadius(24)
    }
}
