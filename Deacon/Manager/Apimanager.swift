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
   

    class func requestApiWithDictParam<T:Decodable>(url:String,params:[String : AnyObject],modalType:T.Type, completion : @escaping (_ response : [T]?, _ message: String?, _ success : Bool)-> ()) {
       
        Utility.showLoader()
        WebServices.postWebService(urlString: url, params: params) { (response, message, status) in
            print(response ?? "Error")
            guard let data = response else {return}
            guard let responseModel = try? JSONDecoder().decode([T].self, from: data) else {
                return  completion(nil, "Failed", false)
                    }
            
            completion(responseModel , "Success", true)
            Utility.hideLoader()
        }
    }
    //MARK :- Post
    class func postWebService(urlString: String, params: [String : AnyObject], completion : @escaping (_ response : Data?, _ message: String?, _ success : Bool)-> Void) {
        alamofireFunction(urlString: urlString, method: .get, paramters: params) { (response, message, success) in
            if response != nil {
                completion(response, "", true)
            }else{
                completion(nil, "", false)
            }
        }
    }

    class func alamofireFunction(urlString : String, method : Alamofire.HTTPMethod, paramters : [String : AnyObject], completion : @escaping (_ response : Data?, _ message: String?, _ success : Bool)-> Void){

        if method == Alamofire.HTTPMethod.post {
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

        }else {
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
