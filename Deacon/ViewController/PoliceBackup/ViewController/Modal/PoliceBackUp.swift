//
//  PoliceBackUp.swift
//  Deacon
//
//  Created by Apple on 14/07/21.
//


import Foundation

// MARK: - Welcome
struct PoliceBackUpModal: Codable {
    let item1: Int?
    let item2: String?
    let item3: PoliceData?

    enum CodingKeys: String, CodingKey {
        case item1 = "Item1"
        case item2 = "Item2"
        case item3 = "Item3"
    }
}

// MARK: - Item3
struct PoliceData: Codable {
    let policeBackupID: Int?
    let crewLeader, date, workAddress, workOrderNumber: String?
    let officerName, policeDepartment, hoursWorked: String?
    let car: Bool?
    let uPloadImage1, uPloadImage2, uPloadImage3, dateTime: String?
    let remark: JSONNull?
    let localID: String?

    enum CodingKeys: String, CodingKey {
        case policeBackupID = "PoliceBackup_Id"
        case crewLeader = "CrewLeader"
        case date = "Date"
        case workAddress = "WorkAddress"
        case workOrderNumber = "WorkOrderNumber"
        case officerName = "OfficerName"
        case policeDepartment = "PoliceDepartment"
        case hoursWorked = "HoursWorked"
        case car
        case uPloadImage1 = "UPloadImage1"
        case uPloadImage2 = "UPloadImage2"
        case uPloadImage3 = "UPloadImage3"
        case dateTime = "DateTime"
        case remark = "Remark"
        case localID = "LocalId"
    }
}
