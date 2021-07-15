//
//  CDDeacon+CoreDataProperties.swift
//  Deacon
//
//  Created by Apple on 16/07/21.
//
//

import Foundation
import CoreData


extension CDDeacon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDeacon> {
        return NSFetchRequest<CDDeacon>(entityName: "CDDeacon")
    }

    @NSManaged public var params: [String:Any]?
    @NSManaged public var uuID: UUID?
    func convertToData() -> DataModal
    {
        return DataModal(params: params, iD: uuID!)
    }
}

extension CDDeacon : Identifiable {

}
