//
//  DatabaseManager.swift
//  Deacon
//
//  Created by Apple on 17/07/21.
//

import Foundation
class DataBaseManager{
   static let shared = DataBaseManager()
    var imageType:[ImageType?] = []
    var getValues:[DataModal]? = []
    let manager =  DataManager()

    private init(){
    }
    
    func uploadOfflineData(){
        print(manager.fetchData()!)
        self.getValues =  manager.fetchData()
        if self.getValues?.count ?? 0 > 0{
            apiRequest(url:self.getValues?[0].url ?? "" , requestType: self.getValues?[0].requestType ?? "", params: self.getValues?[0].params ?? [:], imageData: self.getValues?[0].imageData ?? [], imageType: self.getValues?[0].imageType ?? [], imageParameter: self.getValues![0].imageParameter!, uuid: (self.getValues?[0].uuID!)!, index: 0)
        }
    }
    
    func apiRequest(url:String,requestType:String,params:[String:Any],imageData:[Data],imageType:[String],imageParameter:[String],uuid:UUID, index:Int){
        var indexValue = index
        self.imageType.removeAll()
         imageType.forEach({(getdata) in
            if getdata == "png"{
                self.imageType.append(ImageType.png)
            }else if getdata == "jpeg"{
                self.imageType.append(ImageType.jpeg)
            }else{
                self.imageType.append(nil)
            }
        })
        var param:[String:Any] = [:]
        param = params
        if param["WasValveBox"]  as? Int == 1{
            param["WasValveBox"]  = true
        }
        if param["WasValveBox"]  as? Int == 0{
           param["WasValveBox"]  = false
        }
        if param["car"]  as? Int == 1{
           param["car"]  = true
        }
        if param["car"]  as? Int == 0{
           param["car"]  = false
        }
        WebServices.requestApiWithDictParamforDatabase(url: url, requestType:requestType, params:param, imageData: imageData, imageType: self.imageType , imageParameter: imageParameter) {( message, status ) in
                if status {
                    if self.manager.deleteData(id: uuid){
                        print("success....................................................................")
                        indexValue += 1
                        if indexValue < self.getValues?.count ?? 0{
                            self.apiRequest(url: self.getValues?[indexValue].url ?? "", requestType: self.getValues?[indexValue].requestType ?? "", params: self.getValues?[indexValue].params ?? [:], imageData: self.getValues?[indexValue].imageData ?? [], imageType: self.getValues?[0].imageType ?? [], imageParameter: self.getValues![0].imageParameter!, uuid: (self.getValues?[indexValue].uuID!)!, index: indexValue)
                        }
                    }
                }else{
                    print("as....")
            }
        }
    }
}
