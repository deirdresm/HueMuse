//
//  ArtworkDetailView.swift
//  HueMuse
//
//  Created by Tianna Henry-Lewis on 2021-02-20.
//

import SwiftUI

struct ArtworkDetailView: View {
    let piece: Artwork

    // TODO macOS conditionals
    private let screenHeight = UIScreen.main.bounds.size.height
    private let screenWidth = UIScreen.main.bounds.size.width

    //@State var searchColour: UIColor
    
    var body: some View {
        VStack(spacing: 0) {
            Image(piece.imageID)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth - 20, height: screenHeight/2)
            
            VStack(spacing: 15) {
                Text(piece.title)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                Text("\(piece.dateDisplay), \(piece.artistDisplay)")
            }
            .frame(maxWidth: .infinity)
            //TODO: 🚧 Update to match the colour selected by the user
            .background(Color.yellow)

            ScrollView(.vertical, showsIndicators: false, content: {
                Text(piece.description)
            })
            .padding()
        }
    }
}

struct ArtworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkDetailView(piece: Artwork.shakyamuni)
    }
}
