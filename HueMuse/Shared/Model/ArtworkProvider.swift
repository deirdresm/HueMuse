//
//  ArtworkProvider.swift
//  HueMuse
//
//  Created by Deirdre Saoirse Moen on 2/19/21.
//

import Foundation

class ArtworkProvider {
    let feed = "https://api.artic.edu/api/v1/artworks/search?query[term][is_public_domain]=true&limit=100&fields=id,title,image_id,artist_display,date_display,place_of_origin,copyright_notice,colorfulness,color"

    // to get the image itself:

    // "https://www.artic.edu/iiif/2/\(piece.imageID)/full/843,/0/default.jpg"

    // TODO: pagination!

    func fetchArtwork(completionHandler: @escaping (Error?) -> Void) {
        // Create a URL to load, and a URLSession to load it.
        guard let jsonURL = URL(string: feed) else {
            completionHandler(DataError.urlError)
            return
        }
        let session = URLSession(configuration: .default)

        // Create a URLSession dataTask to fetch the feed.
        let task = session.dataTask(with: jsonURL) { data, _, urlSessionError in

            // Alert any error returned by URLSession.
            guard urlSessionError == nil else {
                completionHandler(urlSessionError)
                return
            }

            // Alert the user if no data comes back.
            guard let data = data else {
                completionHandler(DataError.networkUnavailable)
                return
            }

            // Decode the JSON
            do {
                // Decode the JSON into codable type MuseumResponse.
                let museumPieces = try JSONDecoder().decode(MuseumResponse.self, from: data)
                print("\(Date()) Parsed \(museumPieces.artworks.count) artworks.")

                // TODO: filter out
            } catch {
                // Alert the user if data cannot be digested.
                completionHandler(error)
                return
            }
            completionHandler(nil)
        }
        // Start the task.
        print("\(Date()) Start fetching data from server ...")
        task.resume()
    }
}


