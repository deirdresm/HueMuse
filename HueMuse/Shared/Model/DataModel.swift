//
//  DataModel.swift
//  HueMuse
//
//  Created by Deirdre Saoirse Moen on 2/20/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let museumResponse = try MuseumResponse(json)

import Foundation

// MARK: - Pagination
struct Pagination: Codable {
    let total, limit, offset, totalPages: Int
    let currentPage: Int

    enum CodingKeys: String, CodingKey {
        case total, limit, offset
        case totalPages = "total_pages"
        case currentPage = "current_page"
    }
}

// MARK: Pagination convenience initializers and mutators

extension Pagination {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Pagination.self, from: data)
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
        total: Int? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        totalPages: Int? = nil,
        currentPage: Int? = nil
    ) -> Pagination {
        return Pagination(
            total: total ?? self.total,
            limit: limit ?? self.limit,
            offset: offset ?? self.offset,
            totalPages: totalPages ?? self.totalPages,
            currentPage: currentPage ?? self.currentPage
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - MuseumResponse
struct MuseumResponse: Codable {
    let preference: String?
    let pagination: Pagination
    let artworks: [Artwork]
}

// MARK: MuseumResponse convenience initializers and mutators

extension MuseumResponse {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MuseumResponse.self, from: data)
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
        preference: String? = nil,
        pagination: Pagination? = nil,
        artworks: [Artwork]? = nil
    ) -> MuseumResponse {
        return MuseumResponse(
            preference: preference ?? self.preference,
            pagination: pagination ?? self.pagination,
            artworks: artworks ?? self.artworks
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

