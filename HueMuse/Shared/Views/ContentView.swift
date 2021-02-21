//
//  ContentView.swift
//  HueMuse
//
//  Created by Tianna Henry-Lewis on 2021-02-20.
//

import SwiftUI

struct ContentView: View {

    @State private var selectedColour: Color = .red

    // TODO: linkage from changing the color to changing the hue bucket
    @ObservedObject var pieces: CurrentPieces

    // these next three vars were private, but then it said ContentView was inaccessible after I made changes - dsm
    let screenWidth = UIScreen.main.bounds.size.width

    let tempData: [Artwork] = [Artwork.vanGogh, Artwork.shakyamuni, Artwork.caillebotte, Artwork.seurat, Artwork.motecuhzoma]

    var twoColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            VStack {
                Group {
                    ColorPicker("Find Hue Inspiration", selection: $selectedColour)
                }
                .padding()

                Divider()

                ScrollView(.vertical, showsIndicators: false, content: {
                    LazyVGrid(columns: twoColumnGrid, spacing: 20) {
                        ForEach (0..<tempData.count) { item in
                            NavigationLink(destination: ArtworkDetailView(
                                    piece: self.tempData[item])) {
                                Image(self.tempData[item].imageID)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: (screenWidth/2 - 10))
                                    .cornerRadius(15)
                            }
                        }
                    }
                })
                .padding(5)


            }
            .navigationBarTitle(Text("HueMuse"))
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pieces: CurrentPieces(pieces: [Artwork.vanGogh, Artwork.shakyamuni, Artwork.caillebotte, Artwork.seurat, Artwork.motecuhzoma], hue: 0))
    }
}
