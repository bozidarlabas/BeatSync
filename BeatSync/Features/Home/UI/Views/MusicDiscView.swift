//
//  MusicDiscView.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

struct MusicDiscView: View {
    
    let name: String, artistName: String, coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                Circle().foregroundColor(.whiteOpacity)
                    .frame(width: 101, height: 101)
                coverImage.resizable().scaledToFill()
                    .frame(width: 100, height: 100).cornerRadius(50)
            }
            Text(name).foregroundColor(.textPrimary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12).padding(.bottom, 6)
            Text(artistName).foregroundColor(.textPrimaryF1)
                .modifier(FontModifier(.regular, size: 12))
                .padding(.bottom, 8)
        }
    }
}

//struct MusicDiscView_Previews: PreviewProvider {
//    static var previews: some View {
//        MusicDiscView()
//    }
//}
