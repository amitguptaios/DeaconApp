//
//  SearchDetailsModal.swift
//  Deacon
//
//  Created by Apple on 08/07/21.
//

import Foundation
struct SetCellData {
    let title:String
}
struct SetCellValues {
    let description:String
}
class SearchDetailsModal{
    
    var cellData:[String] = []
    var getcellData:[SetCellData] = []
    var getCellValues:SearchModal?
    var setCellValues:[SetCellValues] = []
    var totalData:[[Any]] = []
    
    
    func prepareData(getSeachMOdal:SearchModal,comple:@escaping([[Any]])->()){
        
        cellData = ["Assignment","Work Order","Department","Location","Released by","Autority by","Task Plan"]
        getCellValues = getSeachMOdal
        prepareModal()
        comple(totalData)
    }
    
    func prepareModal(){
        cellData.forEach{ data in
            getcellData.append(SetCellData(title: data))
        }
        
        setCellValues.append(SetCellValues(description: getCellValues?.activityNote ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.assignmentStatus ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.workOrder ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.department1 ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.location ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.releasedBy ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.authorizedBy ?? ""))
        setCellValues.append(SetCellValues(description: getCellValues?.taskPlan ?? ""))
        totalData.append(getcellData)
        totalData.append(setCellValues)

    }
    
    
}
