//
//  UIViewControllerExtn.swift
//  Deacon
//
//  Created by Apple on 14/07/21.
//

import Foundation
import  UIKit

extension UIViewController {

    func AskConfirmation (title:String, message:String,isCancel:Bool, completion:@escaping (_ result:Bool) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    self.present(alert, animated: true, completion: nil)

    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
        completion(true)
    }))
    if isCancel{
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        completion(false)
    }))
    }
  }
}
