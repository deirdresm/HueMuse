//
//  Artwork+Previews.swift
//  HueMuse
//
//  Created by Deirdre Saoirse Moen on 2/20/21.
//

import SwiftUI

extension Artwork {

    public static var vanGogh: Artwork {
        let color = ArtColor(s: 84, percentage: 0.30623617995004176, h: 40, l: 33, population: 1709)

        let artwork = Artwork(score: 12731.75, colorfulness: 65.636, copyrightNotice: nil, color: color, artistDisplay: "Vincent van Gogh\nDutch, 1853-1890", dateDisplay: "1889", id: 28560, imageID: "25c31d8d-21a4-9ea1-1d73-6a2eca4dda7e", title: "The Bedroom", placeOfOrigin: "Netherlands", classificationTitle: "painting", classificationTitles: [])

        return artwork
    }

    public static var shakyamuni: Artwork {
        let color = ArtColor(s: 0, percentage: 0.06640240759373431, h: 164, l: 82, population: 590)

        let artwork = Artwork(score: 8487.833, colorfulness: 11.9971, copyrightNotice: nil, color: color, artistDisplay: "India\nTamil Nadu, Nagapattinam", dateDisplay: "Chola period, about 12th century", id: 21023, imageID: "0675f9a9-1a7b-c90a-3bb6-7f7be2afb678", title: "Buddha Shakyamuni Seated in Meditation (Dhyanamudra)", placeOfOrigin: "Nagapattinam", classificationTitle: "painting", classificationTitles: [])

        return artwork
    }

    public static var caillebotte: Artwork {
        let color = ArtColor(s: 14, percentage: 0.04690626895945958, h: 205, l: 51, population: 259)

        let artwork = Artwork(score: 2121.9583, colorfulness: 13.6209, copyrightNotice: nil, color: color, artistDisplay: "Gustave Caillebotte \n(French, 1848-1894", dateDisplay: "1877", id: 20684, imageID: "f8fd76e9-c396-5678-36ed-6a348c904d27", title: "Paris Street; Rainy Day", placeOfOrigin: "Paris", classificationTitle: "painting", classificationTitles: [])

        return artwork
    }

    public static var seurat: Artwork {
        let color = ArtColor(s: 53, percentage: 3.4270059722433076e-05, h: 229, l: 32, population: 63)

        let artwork = Artwork(score: 1818.8214, colorfulness: nil, copyrightNotice: nil, color: color, artistDisplay: "Georges Seurat\nFrench, 1859-1891", dateDisplay: "1884/86", id: 27992, imageID: "1adf2696-8489-499b-cad2-821d7fde4b33", title: "A Sunday on La Grande Jatte — 1884", placeOfOrigin: "France", classificationTitle: "painting", classificationTitles: [])

        return artwork
    }

    public static var motecuhzoma: Artwork {
        let color = ArtColor(s: 4, percentage: 0.06236480357267462, h: 43, l: 52, population: 572)

        let artwork = Artwork(score: 848.7833, colorfulness: 13.5583, copyrightNotice: nil, color: color, artistDisplay: "Aztec (Mexica)\nTenochtitlan, Mexico", dateDisplay: "1503", id: 75644, imageID: "ea8c5d62-6ce8-88e8-feb1-e0053cf534c5", title: "Coronation Stone of Motecuhzoma II (Stone of the Five Suns)", placeOfOrigin: "Tenochtitlan", classificationTitle: "painting", classificationTitles: [])

        return artwork
    }
}
