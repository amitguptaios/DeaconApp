//
//  UItextFeildExtension.swift
//  Deacon
//
//  Created by Apple on 12/07/21.
//

import Foundation
import  UIKit
extension UITextField {

    func addInputViewDatePicker(target: Any, selector: Selector,style:PickerStyle) {

   let screenWidth = UIScreen.main.bounds.width

   //Add DatePicker as inputView
   let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 250))
        if style == .Date{
   datePicker.datePickerMode = .date
        }else{
    datePicker.datePickerMode = .time
        }
    datePicker.locale = .current
    datePicker.sizeToFit()
    if #available(iOS 14.0, *) {
        datePicker.preferredDatePickerStyle = .wheels
    } else {
        // Fallback on earlier versions
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
            
        }
    }
   self.inputView = datePicker

   //Add Tool Bar as input AccessoryView
   let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 44))
   let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
   let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
   let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
   toolBar.setItems([cancelBarButton, flexibleSpace, doneBarButton], animated: false)
   toolBar.sizeToFit()
   self.inputAccessoryView = toolBar
}

  @objc func cancelPressed() {
    self.resignFirstResponder()
  }
}
