//
//  DataReository.swift
//  Deacon
//
//  Created by Apple on 15/07/21.
//
import  CoreData
import Foundation
protocol Repository {

    func create(dataModal: DataModal)
    func getAll() -> [DataModal]?
    func get(byIdentifier id: UUID) -> CDDeacon?
    func delete(id: UUID) -> Bool
}

struct DataRepository : Repository
{
  
    
    func create(dataModal: DataModal) {

        let cdDeacon = CDDeacon(context: PersistentStorage.shared.context)
        cdDeacon.params = dataModal.params
        cdDeacon.uuID = dataModal.uuID
        cdDeacon.imageData = dataModal.imageData
        cdDeacon.imageParameter = dataModal.imageParameter
        cdDeacon.imageType = dataModal.imageType
        cdDeacon.requestType = dataModal.requestType
        cdDeacon.url = dataModal.url
        PersistentStorage.shared.saveContext()

    }

    func getAll() -> [DataModal]? {

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CDDeacon.self)

        var dataModal : [DataModal] = []

        result?.forEach({ (cddatModal) in
            dataModal.append(cddatModal.convertToData())
        })

        return dataModal
    }
    
    
    func delete(id: UUID) -> Bool {

         let cdData = get(byIdentifier: id)
         guard cdData != nil else {return false}
         PersistentStorage.shared.context.delete(cdData!)
         PersistentStorage.shared.saveContext()
         return true
     }

     func get(byIdentifier id: UUID) -> CDDeacon?
    {
        let fetchRequest = NSFetchRequest<CDDeacon>(entityName: "CDDeacon")
        let predicate = NSPredicate(format: "uuID==%@", id as CVarArg)

        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first

            guard result != nil else {return nil}

            return result

        } catch let error {
            debugPrint(error)
        }

        return nil
    }
    
}
