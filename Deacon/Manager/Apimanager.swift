//
//  Apimanager.swift
//  Deacon
//
//  Created by Apple on 06/07/21.
//

import Foundation
import Alamofire
class WebServices: NSObject {
   

    // MARK: -  Api Request
   

    class func requestApiWithDictParam<T:Decodable>(url:String,requestType:RequestType,params:[String : Any],imageData:[Data?] = [],imageType:[ImageType?] = [],imageParameter:String = "",modalType:T.Type, completion : @escaping (_ response : T?, _ message: String?, _ success : Bool)-> ()) {
       
        Utility.showLoader()
        WebServices.postWebService(urlString: url, requestType: requestType, params: params, imageData:imageData, imageType: imageType, imageParameter: imageParameter) { (response, message, status) in
            print(response ?? "Error")
            Utility.hideLoader()
            guard let data = response else {return}
            guard let responseModel = try? JSONDecoder().decode(T.self, from: data) else {
                return  completion(nil, "Failed", false)
                    }
            
            completion(responseModel , "Success", true)
        }
    }
    
    class func postWebService(urlString: String,requestType:RequestType, params: [String : Any],imageData:[Data?],imageType:[ImageType?],imageParameter:String, completion : @escaping (_ response : Data?, _ message: String?, _ success : Bool)-> Void) {
        var httpMethod:HTTPMethod!
        if requestType == .Get{
            httpMethod =  .get
        }else{
            httpMethod =  .post
        }
        alamofireFunction(urlString: urlString, method:httpMethod, paramters: params, imageData: imageData, imageType: imageType, imageParameter: imageParameter) { (response, message, success) in
            if response != nil {
                completion(response, "", true)
            }else{
                completion(nil, "", false)
            }
        }
    }

    class func alamofireFunction(urlString : String, method : Alamofire.HTTPMethod, paramters : [String : Any],imageData:[Data?],imageType:[ImageType?],imageParameter:String, completion : @escaping (_ response : Data?, _ message: String?, _ success : Bool)-> Void){

        if method == Alamofire.HTTPMethod.post {
            //ONLY FOR POST REQUEST
            if imageData.count == 0{
            AF.request(urlString, method: .post, parameters: paramters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

                print(urlString)
                switch response.result
                {
                case .success( _):
                    completion(response.data, "", true)

                case .failure(let error):
                    completion(nil, "\(error)", false)

                }

            }
                return
            }
            //ONLY FOR POST MULTIPART REQUEST

            let headers : HTTPHeaders = [
                "Accept": "application/json",
                "Content-Type" : "application/json; charset=utf-8"
            ]
            AF.upload(multipartFormData: { multipartFormData in
        
        for (key, value) in paramters {
            if let temp = value as? String {
                multipartFormData.append(temp.data(using: .utf8)!, withName: key)
            }
            if let temp = value as? Int {
                multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key)
            }
            if let temp = value as? NSArray {
                temp.forEach({ element in
                    let keyObj = key + "[]"
                    if let string = element as? String {
                        multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
                    } else
                    if let num = element as? Int {
                        let value = "\(num)"
                        multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
                    }
                })
            }
           }
        for index  in 0..<imageData.count{
            if let data = imageData[index]{
                if let getImageType = imageType[index]{
                    multipartFormData.append(data, withName: "\(imageParameter)\(index+1)", fileName: "\(Date.init().timeIntervalSince1970).\(getImageType)", mimeType: "image/\(getImageType)")
                }
            }else{
                
                multipartFormData.append(imageData[index] ?? Data(), withName: "\(imageParameter)\(index+1)", fileName: "", mimeType: "image/png")
            }
        }
            },
            to: urlString, method: .post , headers: headers)
            .responseJSON(completionHandler: { (response) in
                
                print(response)
                
                if let err = response.error{
                    print("ERROR..",err)
                    // onError?(err)
                    return
                }
                print("Succesfully uploaded")
                
                let json = response.data
                
                if (json != nil)
                {
                    completion(response.data, "", true)
                }
            })

        }else {
            //ONLY FOR  GET REQUEST
            AF.request(urlString).responseJSON { (response) in
                switch response.result
                {
                case .success(_):
                    completion(response.data, "", true)
                    
                case .failure(let error):
                    completion(nil, "\(error)", false)
                    
                }
                
            }
        }
    }


}
