//
//  CDDeacon+CoreDataProperties.swift
//  Deacon
//
//  Created by Apple on 17/07/21.
//
//

import Foundation
import CoreData


extension CDDeacon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDDeacon> {
        return NSFetchRequest<CDDeacon>(entityName: "CDDeacon")
    }

        @NSManaged public var imageData: [Data]?
        @NSManaged public var imageParameter: [String]?
        @NSManaged public var imageType: [String]?
        @NSManaged public var params: [String:Any]?
        @NSManaged public var requestType: String?
        @NSManaged public var url: String?
        @NSManaged public var uuID: UUID?
    
    func convertToData()->DataModal{
        return DataModal(imageData: imageData ?? [], imageParameter: imageParameter ?? [], imageType: imageType, params: params, requestType: requestType ?? "", url: url ?? "", uuID: uuID!)
       }
}

extension CDDeacon : Identifiable {

}
