//
//  AlbumListView.swift
//  SwiftUI Animations
//
//  Created by Nitin Aggarwal on 15/12/22.
//

import SwiftUI

struct AlbumListView: View {
    
    // MARK: - Properties
    var safeArea: EdgeInsets
    var size: CGSize
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                // Artwork
                artwork()
                
                GeometryReader { proxy in
                    
                    let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                    
                    Button {
                        
                    } label: {
                        Text("SHUFFLE PLAY")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 35)
                            .padding(.vertical, 12)
                            .background {
                                Capsule()
                                    .fill(Color("ColorSpotifyGreen").gradient)
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: minY < 50 ? -(minY - 50) : 0)
                }
                .frame(height: 50)
                .padding(.top, -34)
                .zIndex(1)
                
                VStack {
                    Text("Popular")
                        .fontWeight(.bold)
                    
                    albumView()
                }
                .padding(.top, 10)
                .zIndex(0)
            }
            .overlay(alignment: .top) {
                headerView()
            }
        }
        .coordinateSpace(name: "SCROLL")
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func artwork() -> some View {
        let height = size.height * 0.45
        
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            
            Image("taylor_swift")
                .resizable()
                .scaledToFill()
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    // MARK: - Gradient Overlay
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(
                                .linearGradient(Gradient(colors: [
                                    Color.black.opacity(0 - progress),
                                    Color.black.opacity(0.1 - progress),
                                    Color.black.opacity(0.3 - progress),
                                    Color.black.opacity(0.5 - progress),
                                    Color.black.opacity(0.8 - progress),
                                    Color.black.opacity(1)
                                ]), startPoint: .top, endPoint: .bottom)
                            )
                        
                        VStack(spacing: 0) {
                            Text("Taylor Swift")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            
                            Text("80+ million monthly listeners")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.secondary)
                                .padding(.top, 15)
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .padding(.bottom, 55)
                        .offset(y: minY < 0 ? minY : 0)
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func albumView() -> some View {
        VStack(spacing: 25) {
            ForEach(albumArray.indices, id: \.self) { index in
                VStack(spacing: 0) {
                    HStack(spacing: 20) {
                        VStack {
                            Text("\(index + 1)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.secondary)
                            
                            Spacer()
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(albumArray[index].title)
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Text(albumArray[index].playCount)
                                .font(.callout)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "ellipsis")
                            .foregroundColor(.secondary)
                    }
                    
                    Divider()
                        .padding(.top, 8)
                }
            }
        }
        .padding(15)
    }
    
    @ViewBuilder
    func headerView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Text("Following")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .border(.white, width: 1.5)
                }
                .opacity(1 + progress)
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
            .overlay(content: {
                Text("Taylor Swift")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.75 ? 0 : 45)
                    .clipped()
                    .animation(.easeInOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 10)
            .background(content: {
                Color.black.opacity(-progress > 1 ? 1 : 0)
            })
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            let safeArea = proxy.safeAreaInsets
            let size = proxy.size
            AlbumListView(safeArea: safeArea, size: size)
        }
        .preferredColorScheme(.dark)
    }
}
