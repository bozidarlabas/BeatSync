//
//  MadeForView.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

struct MadeForView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            Image.profile_pic.resizable().scaledToFill()
                .frame(width: 114, height: 140).cornerRadius(16)
            VStack(alignment: .leading, spacing: 8) {
                Text("Discover Weekly").foregroundColor(.textPrimary)
                    .modifier(FontModifier(.bold, size: 18))
                Text("Weekly dose of fresh tunes: Discover handpicked new music and deep cuts just for you.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.textPrimaryF1)
                    .modifier(FontModifier(.regular, size: 13))
            }.padding(.leading, 12)
            Spacer()
        }
        .padding(12).background(Color.primaryColor)
        .cornerRadius(24)
    }
}
