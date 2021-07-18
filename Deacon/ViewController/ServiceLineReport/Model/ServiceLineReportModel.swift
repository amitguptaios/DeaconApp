//
//  ServiceLineReportModel.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//
//
import UIKit
import Foundation

// MARK: - Welcome
struct ServiceLineReportModel: Codable {
    let item1: Int?
    let item2: String?
    let serviceLineResult: ServiceLineResult?

    enum CodingKeys: String, CodingKey {
        case item1 = "Item1"
        case item2 = "Item2"
        case serviceLineResult = "Item3"
    }
}

// MARK: - Item3
struct ServiceLineResult: Codable {
    let serviceID: Int?
    let crewLeader, date, workAddress, workOrderNumber: String?
    let enterTown, curbBoxInfo, suezSide, customerSize: String?
    let serviceLength, leadRemove, serviceDepth, mainSize: String?
    let mainDepth, mainCurbDis, cBlocCorner, curbsize: String?
    let mainExcavSize, trenchExcavSize, gasExcavSize, installWork: String?
    let preconPhoto, markoutPhoto, curbStopPhoto, oldtap: String?
    let newtap, serviceLine, concreteThick, worksheet: String?
    let endDayPhoto1, extraPhoto2, extraPhoto1, dateTime: String?
    let remark: JSONNull?
    let localID: String?

    enum CodingKeys: String, CodingKey {
        case serviceID = "Service_Id"
        case crewLeader = "Crew_leader"
        case date = "Date"
        case workAddress = "WorkAddress"
        case workOrderNumber = "WorkOrderNumber"
        case enterTown = "EnterTown"
        case curbBoxInfo = "CurbBoxInfo"
        case suezSide = "SuezSide"
        case customerSize = "CustomerSize"
        case serviceLength = "ServiceLength"
        case leadRemove = "LeadRemove"
        case serviceDepth = "ServiceDepth"
        case mainSize = "MainSize"
        case mainDepth = "MainDepth"
        case mainCurbDis = "MainCurbDis"
        case cBlocCorner = "CBlocCorner"
        case curbsize = "Curbsize"
        case mainExcavSize = "MainExcavSize"
        case trenchExcavSize = "TrenchExcavSize"
        case gasExcavSize = "GasExcavSize"
        case installWork = "Install_Work"
        case preconPhoto = "PreconPhoto"
        case markoutPhoto = "MarkoutPhoto"
        case curbStopPhoto = "CurbStopPhoto"
        case oldtap = "Oldtap"
        case newtap = "Newtap"
        case serviceLine = "ServiceLine"
        case concreteThick = "ConcreteThick"
        case worksheet
        case endDayPhoto1 = "EndDayPhoto1"
        case extraPhoto2 = "ExtraPhoto2"
        case extraPhoto1 = "ExtraPhoto1"
        case dateTime = "DateTime"
        case remark = "Remark"
        case localID = "LocalId"
    }
}
