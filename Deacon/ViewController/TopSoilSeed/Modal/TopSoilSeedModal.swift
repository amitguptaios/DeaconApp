//
//  TopSoilSeedModal.swift
//  Deacon
//
//  Created by Apple on 10/07/21.
//



import Foundation

// MARK: - Welcome
struct TopSoilFeedModal: Codable {
    let item1: Int
    let item2: String
    let item3: Item3

    enum CodingKeys: String, CodingKey {
        case item1 = "Item1"
        case item2 = "Item2"
        case item3 = "Item3"
    }
}

// MARK: - Item3
struct Item3: Codable {
    let nestedID: Int
    let crewLeader, date, workAddress, townJob: String
    let grassSize, workComplete, photos1: String
    let photos2, photos3, dateTime: String
    let remark: JSONNull?
    let localID: JSONNull?
    let note: JSONNull?
    let workPerformed: JSONNull?

    enum CodingKeys: String, CodingKey {
        case nestedID = "Nested_Id"
        case crewLeader = "CrewLeader"
        case date = "Date"
        case workAddress = "WorkAddress"
        case townJob = "Town_job"
        case workPerformed = "WorkPerformed"
        case grassSize = "GrassSize"
        case workComplete = "WorkComplete"
        case photos1 = "Photos1"
        case photos2 = "Photos2"
        case photos3 = "Photos3"
        case note = "Note"
        case dateTime = "DateTime"
        case remark = "Remark"
        case localID = "LocalId"
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
