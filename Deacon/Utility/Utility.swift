//
//  Utility.swift
//  Deacon
//
//  Created by Apple on 07/07/21.
//

import Foundation
import  SVProgressHUD
class Utility{
    
    class func showLoader(){
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(UIColor.white)   //Ring Color
        SVProgressHUD.setBackgroundColor(UIColor.black)   //HUD Color
        SVProgressHUD.setBackgroundLayerColor(UIColor.init(red: 0, green: 0, blue: 0, alpha:0.5))    //Background Color
        SVProgressHUD.show()
    }
    
    class func hideLoader(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
