//
//  HomeView.swift
//  BeatSync
//
//  Created by Bozidar Labas on 26/11/23.
//

import SwiftUI

fileprivate let HORIZONTAL_SPACING: CGFloat = 24

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            Color.primaryColor.edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    HomeHeaderView(headerStr: viewModel.headerStr)
                    // Made for You
                    HomeMadeForView(onSelect: viewModel.selectMusic(music:))
                    // Playlists
                    HomePlaylistView(playlists: viewModel.playlists, onSelect: viewModel.selectMusic(music:))
                    // Recently Played
                    HomeRecentlyPlayedView(recentlyPlayed: viewModel.recentlyPlayed, onSelect: viewModel.selectMusic(music:))
                    
                    Spacer().frame(height: 150)
                    Spacer()
                }
                .fullScreenCover(isPresented: $viewModel.displayPlayer) {
                    if let model = viewModel.selectedMusic {
                        PlayerView(viewModel: PlayerViewModel(model: model))
                    }
                }
            }.animation(.spring()).edgesIgnoringSafeArea([.horizontal, .bottom])
        }
    }
}


fileprivate struct HomeHeaderView: View {
    let headerStr: String
    var body: some View {
        HStack(alignment: .center) {
            Text(headerStr).foregroundColor(.textPrimary)
                .modifier(FontModifier(.black, size: 28))
            Spacer()
            Button(action: {  }) {
                Image.search.resizable().frame(width: 16, height: 16)
                    .padding(12).background(Color.primaryColor)
                    .cornerRadius(20)
            }
        }.padding(.top, 12).padding(.horizontal, HORIZONTAL_SPACING)
    }
}


fileprivate struct HomePlaylistView: View {
    let playlists: [MusicModel], onSelect: (MusicModel) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Playlist").foregroundColor(.textPrimary)
                .modifier(FontModifier(.bold, size: 20)).padding(.leading, HORIZONTAL_SPACING)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<playlists.count, id: \.self) { i in
                        Button(action: { onSelect(playlists[i]) }, label: {
                            PlaylistView(name: playlists[i].name,
                                         artistName: playlists[i].artistName,
                                         coverImage: playlists[i].coverImage)
                        }).padding(.top, 0).padding(.bottom, 40)
                    }
                }.padding(.horizontal, HORIZONTAL_SPACING)
            }
        }.padding(.top, 36)
    }
}


fileprivate struct HomeRecentlyPlayedView: View {
    let recentlyPlayed: [MusicModel], onSelect: (MusicModel) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Recently Played").foregroundColor(.textPrimary)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<recentlyPlayed.count, id: \.self) { i in
                        Button(action: { onSelect(recentlyPlayed[i]) }, label: {
                            MusicDiscView(name: recentlyPlayed[i].name,
                                          artistName: recentlyPlayed[i].artistName,
                                          coverImage: recentlyPlayed[i].coverImage)
                        }).padding(.top, 6).padding(.bottom, 40)
                    }
                }.padding(.horizontal, HORIZONTAL_SPACING)
            }
        }
    }
}


fileprivate struct HomeMadeForView: View {
    let onSelect: (MusicModel) -> ()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Flow").foregroundColor(.textPrimary)
                .modifier(FontModifier(.bold, size: 20))
                .padding(.leading, HORIZONTAL_SPACING)
            Button(action: { onSelect(MockData.Favorite) }, label: {
                MadeForView()
            }).padding([.horizontal], 15).padding(.bottom, 10)
        }
    }
}
