//
//  Result.swift
//  Szentiras
//
//  Created by Gabor Sornyei on 2020. 08. 24..
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let result = try? newJSONDecoder().decode(Result.self, from: jsonData)

import Foundation

// MARK: - Result
struct Result: Codable {
    let keres: Keres
    let valasz: Valasz

    enum CodingKeys: String, CodingKey {
        case keres = "keres"
        case valasz = "valasz"
    }
}

extension Result: Identifiable {
    var id: String {
        keres.hivatkozas
    }
}

extension Result {
    var chapter: Int {
        let hivatkozas = self.keres.hivatkozas
        let split = hivatkozas.split(separator: " ")
        return Int(split[1]) ?? 0
    }
}

// MARK: - Keres
struct Keres: Codable {
    let feladat: String
    let hivatkozas: String
    let forma: String

    enum CodingKeys: String, CodingKey {
        case feladat = "feladat"
        case hivatkozas = "hivatkozas"
        case forma = "forma"
    }
}

// MARK: - Valasz
struct Valasz: Codable {
    let versek: [Vers]
    let forditas: Forditas

    enum CodingKeys: String, CodingKey {
        case versek = "versek"
        case forditas = "forditas"
    }
}

// MARK: - Forditas
struct Forditas: Codable {
    let nev: String
    let rov: String

    enum CodingKeys: String, CodingKey {
        case nev = "nev"
        case rov = "rov"
    }
}

// MARK: - Versek
struct Vers: Codable {
    let szoveg: String?
    let jegyzetek: [Jegyzet]
    let hely: Hely

    enum CodingKeys: String, CodingKey {
        case szoveg = "szoveg"
        case jegyzetek = "jegyzetek"
        case hely = "hely"
    }
}

extension Vers: Identifiable {
    var id: String {
        String(hely.gepi)
    }
}

extension Vers {
    var gepi: String {
        String(hely.gepi)
    }
    
    var szep: String {
        hely.szep
    }
}

// MARK: - Hely
struct Hely: Codable {
    let gepi: Int
    let szep: String

    enum CodingKeys: String, CodingKey {
        case gepi = "gepi"
        case szep = "szep"
    }
}

// MARK: - Jegyzetek
struct Jegyzet: Codable {
    let position: String?
    let text: String

    enum CodingKeys: String, CodingKey {
        case position = "position"
        case text = "text"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
