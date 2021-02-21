//
//  Artwork.swift
//  HueMuse
//
//  Created by Deirdre Saoirse Moen on 2/20/21.
//

import Foundation

// MARK: - Artwork
struct Artwork: Codable {

    public static var pieces = [Artwork]()

    let score: Double
    let colorfulness: Double?
    let copyrightNotice: String?
    let color: ArtColor?
    let artistDisplay: String
    let dateDisplay: String
    let id: Int
    let imageID, title, placeOfOrigin: String
    var hueBucket: Int = 0 // divide hue into 16 segments, this is the closest.
    let classificationTitle: String
    var classificationTitles: [String]  // always present in data I've seen

    var description: String {
        return self.artistDisplay
    }

    enum CodingKeys: String, CodingKey {
        case score = "_score"
        case colorfulness
        case copyrightNotice = "copyright_notice"
        case color
        case artistDisplay = "artist_display"
        case dateDisplay = "date_display"
        case id
        case imageID = "image_id"
        case title
        case placeOfOrigin = "place_of_origin"

        // to filter based on paintings (as those will typically be the most colourful)
        case classificationTitle = "classification_title"
        case classificationTitles = "classification_titles"    }
}

// MARK: Datum convenience initializers and mutators

extension Artwork {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Artwork.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        score: Double? = nil,
        colorfulness: Double? = nil,
        copyrightNotice: String? = nil,
        color: ArtColor? = nil,
        artistDisplay: String? = nil,
        dateDisplay: String? = nil,
        id: Int? = nil,
        imageID: String? = nil,
        title: String? = nil,
        placeOfOrigin: String? = nil,
        classificationTitle: String? = nil,
        classificationTitles: [String] = []
    ) -> Artwork {
        return Artwork(
            score: score ?? self.score,
            colorfulness: colorfulness ?? self.colorfulness,
            copyrightNotice: copyrightNotice ?? self.copyrightNotice,
            color: color ?? self.color,
            artistDisplay: artistDisplay ?? self.artistDisplay,
            dateDisplay: dateDisplay ?? self.dateDisplay,
            id: id ?? self.id,
            imageID: imageID ?? self.imageID,
            title: title ?? self.title,
            placeOfOrigin: placeOfOrigin ?? self.placeOfOrigin,
            classificationTitle: classificationTitle ?? self.classificationTitle,
            classificationTitles: classificationTitles)
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }

    static func filter(_ listings: [Artwork]) {

        // TODO: may need to filter more than this
        for index in 0 ..< listings.count {
            var piece = listings[index]

            if let c = piece.color {
                piece.hueBucket = (c.h ?? 0) / 16 // nearest hue bucket
                pieces.append(piece)
            }
        }
    }
}

// MARK: - Color
struct ArtColor: Codable {
    let s: Int
    let percentage: Double
    let h, l, population: Int?
}

// MARK: Color convenience initializers and mutators

extension ArtColor {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ArtColor.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        s: Int? = nil,
        percentage: Double? = nil,
        h: Int? = nil,
        l: Int? = nil,
        population: Int? = nil
    ) -> ArtColor {
        return ArtColor(
            s: s ?? self.s,
            percentage: percentage ?? self.percentage,
            h: h ?? self.h,
            l: l ?? self.l,
            population: population ?? self.population
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

