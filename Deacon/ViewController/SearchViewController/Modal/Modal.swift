//
//  Modal.swift
//  Deacon
//
//  Created by Apple on 07/07/21.
//


import Foundation

// MARK: - SearchModal
struct SearchModal: Codable {
    let priorityIcon, assignmentStatus, department1, workOrder: String?
    let workOrderDescription, activity, activityNote, workAddress: String?
    let location, locationDescription, releasedBy, authorizedBy: String?
    let dateReleased, equipment, equipmentDescription, taskPlan: String?
    let taskPlanDescription, supplier, supplierDescription, contractorStartDate: String?
    let actualDate, costCode, newBusinessRequestNumber, status: String?
    let invoiceNumber, invoiceDate: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case priorityIcon = "Priority_Icon"
        case assignmentStatus = "Assignment_Status"
        case department1 = "Department1"
        case workOrder = "Work_Order"
        case workOrderDescription = "Work_Order_Description"
        case activity = "Activity"
        case activityNote = "Activity_Note"
        case workAddress = "Work_Address"
        case location = "Location"
        case locationDescription = "Location_Description"
        case releasedBy = "Released_By"
        case authorizedBy = "Authorized_By"
        case dateReleased = "Date_Released_"
        case equipment = "Equipment"
        case equipmentDescription = "Equipment_Description"
        case taskPlan = "Task_Plan"
        case taskPlanDescription = "Task_Plan_Description"
        case supplier = "Supplier"
        case supplierDescription = "Supplier_Description"
        case contractorStartDate = "Contractor__Start_Date"
        case actualDate = "Actual__Date"
        case costCode = "Cost_Code"
        case newBusinessRequestNumber = "New_Business_Request_Number"
        case status = "Status"
        case invoiceNumber = "Invoice_Number"
        case invoiceDate = "Invoice_Date"
        case id
    }
}

