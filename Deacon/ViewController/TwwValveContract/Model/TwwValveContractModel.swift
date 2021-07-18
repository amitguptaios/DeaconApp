//
//  TwwValveContractModel.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//

import UIKit
import Foundation

// MARK: - Welcome
struct TwwValveContractModel: Codable {
    let item1: Int?
    let item2: String?
    let twwResult: TwwResult?

    enum CodingKeys: String, CodingKey {
        case item1 = "Item1"
        case item2 = "Item2"
        case twwResult = "Item3"
    }
}

// MARK: - Item3
struct TwwResult: Codable {
    let twwID: Int?
    let crewLeader, valveID, valveSize, valveStartPosition: String?
    let noOfTurns, isPackingLeaking, date, timeStartExercise: String?
    let timeEndExercise: String?
    let wasValveBox: Bool?
    let valveImageBefore, valveImageAfter, optionalImage1, optionalImage2: String?
    let optionalImage3, closestAddress, dateTime: String?
    let remark: JSONNull?
    let localID: String?

    enum CodingKeys: String, CodingKey {
        case twwID = "TWW_Id"
        case crewLeader = "CrewLeader"
        case valveID = "ValveID"
        case valveSize = "ValveSize"
        case valveStartPosition = "ValveStartPosition"
        case noOfTurns = "No_Of_Turns"
        case isPackingLeaking = "IsPacking_Leaking"
        case date = "Date"
        case timeStartExercise = "TimeStart_Exercise"
        case timeEndExercise = "TimeEnd_Exercise"
        case wasValveBox = "WasValveBox"
        case valveImageBefore = "ValveImageBefore"
        case valveImageAfter = "ValveImageAfter"
        case optionalImage1 = "OptionalImage1"
        case optionalImage2 = "OptionalImage2"
        case optionalImage3 = "OptionalImage3"
        case closestAddress
        case dateTime = "DateTime"
        case remark = "Remark"
        case localID = "LocalId"
    }
}

