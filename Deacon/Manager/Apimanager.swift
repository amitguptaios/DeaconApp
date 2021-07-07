//
//  Apimanager.swift
//  Deacon
//
//  Created by Apple on 06/07/21.
//

import Foundation
import Alamofire
class WebServices: NSObject {
   

    // MARK: - Login Variables
    var responceData : NSDictionary?
    var responceDataArray : [NSDictionary]?

    class func requestApiWithDictParam(url:String,params:[String : AnyObject], completion : @escaping (_ response : AnyObject?, _ message: String?, _ success : Bool)-> ()) {
       
        
        WebServices.postWebService(urlString: url, params: params) { (response, message, status) in
            print(response ?? "Error")
            let result = WebServices()
            if let data = response as? NSDictionary {
                print(data)
                result.responceData = data
                completion(result, "Success", true)

            }
            else if let data = response as? [NSDictionary] {
                print(data)
                result.responceDataArray = data
                completion(result, "Success", true)

            }
            else {
                completion("" as AnyObject?, "Failed", false)
            }
        }
    }
    //MARK :- Post
    class func postWebService(urlString: String, params: [String : AnyObject], completion : @escaping (_ response : AnyObject?, _ message: String?, _ success : Bool)-> Void) {
        alamofireFunction(urlString: urlString, method: .get, paramters: params) { (response, message, success) in
            if response != nil {
                completion(response as AnyObject?, "", true)
            }else{
                completion(nil, "", false)
            }
        }
    }

    class func alamofireFunction(urlString : String, method : Alamofire.HTTPMethod, paramters : [String : AnyObject], completion : @escaping (_ response : AnyObject?, _ message: String?, _ success : Bool)-> Void){

        if method == Alamofire.HTTPMethod.post {
            AF.request(urlString, method: .post, parameters: paramters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in

                print(urlString)
                switch response.result
                {
                case .success(let json):
                    let jsonData = json
                    print(jsonData)
                    completion(response.response as AnyObject?, "", true)
                    
                case .failure(let error):
                    completion(nil, "\(error)", false)
                    
                }
                
                
            }

        }else {
            AF.request(urlString).responseJSON { (response) in
                switch response.result
                {
                case .success(let json):
                    let jsonData = json
                    print(jsonData)
                    completion(jsonData as AnyObject?, "", true)
                    
                case .failure(let error):
                    completion(nil, "\(error)", false)
                    
                }
                
            }
        }
    }


}
