//
//  ApiName.swift
//  Deacon
//
//  Created by Apple on 06/07/21.
//

import Foundation
struct  WebServiceNames {
    
    static var baseUrl = "http://chavi4hld-001-site1.htempurl.com/api/"
    enum EndPoints: String{
        case searchApi = "SearchWebapi?search="
        case topSoilSeed = "Nested"

        var url: String {
            return WebServiceNames.baseUrl + self.rawValue
        }
    }
}



