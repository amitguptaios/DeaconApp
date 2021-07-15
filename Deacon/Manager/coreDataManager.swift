//
//  coreDataManager.swift
//  Deacon
//
//  Created by Apple on 16/07/21.
//

import Foundation
struct  DataManager {
    
   private let _datarespository =   DataRepository()
    
    
    func createData(data: DataModal) {
        _datarespository.create(dataModal: data)
       }

       func fetchData() -> [DataModal]? {
           return _datarespository.getAll()
       }
    
    func deleteData(id: UUID) -> Bool {
        return _datarespository.delete(id: id)
    }
    
}
