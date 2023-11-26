//
//  PlayerView.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

fileprivate let HORIZONTAL_SPACING: CGFloat = 24

struct PlayerView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            Color.primaryColor.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center) {
                    Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                        Image.close.resizable().frame(width: 20, height: 20)
                            .padding(8)
                            .cornerRadius(20)
                    }
                    Spacer()
                    Button(action: {  }) {
                        Image.options.resizable().frame(width: 16, height: 16)
                            .padding(12).background(Color.primaryColor)
                            .cornerRadius(20)
                    }
                }.padding(.horizontal, HORIZONTAL_SPACING).padding(.top, 12)
                
                PlayerDiscView(coverImage: viewModel.model.coverImage)
                
                Text(viewModel.model.name).foregroundColor(.textPrimary)
                    .modifier(FontModifier(.black, size: 30))
                    .padding(.top, 12)
                Text(viewModel.model.artistName).foregroundColor(.textPrimaryF1)
                    .modifier(FontModifier(.semibold, size: 18))
                    .padding(.top, 12)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 12) {
                    Text("01:34").foregroundColor(.textPrimary)
                        .modifier(FontModifier(.bold, size: 12))
                    Slider(value: $viewModel.slider, in: 0...100)
                        .accentColor(.primaryColor)
                    Button(action: { viewModel.liked.toggle() }) {
                        (viewModel.liked ? Image.heart_filled : Image.heart)
                            .resizable().frame(width: 20, height: 20)
                    }
                }.padding(.horizontal, 45)
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button(action: {  }) {
                        Image.next.resizable().frame(width: 18, height: 18)
                            .rotationEffect(Angle(degrees: 180))
                            .padding(24).background(Color.primaryColor)
                            .cornerRadius(40)
                    }
                    Spacer()
                    Button(action: { viewModel.isPlaying.toggle() }) {
                        (viewModel.isPlaying ? Image.pause : Image.play)
                            .resizable().frame(width: 28, height: 28)
                            .padding(50).background(Color.primaryColor)
                            .cornerRadius(70)
                    }
                    Spacer()
                    Button(action: {  }) {
                        Image.next.resizable().frame(width: 18, height: 18)
                            .padding(24).background(Color.primaryColor)
                            .cornerRadius(40)
                    }
                }.padding(.horizontal, 32)
            }.padding(.bottom, HORIZONTAL_SPACING).animation(.spring())
        }
    }
}

fileprivate struct PlayerDiscView: View {
    let coverImage: Image
    var body: some View {
        ZStack {
            Circle().foregroundColor(.whiteOpacity)
                .frame(width: 121, height: 121)
            coverImage.resizable().scaledToFill()
                .frame(width: 120, height: 120).cornerRadius(60)
        }
    }
}
