//
//  DatePickerCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class DatePickerCell: UITableViewCell,UITextFieldDelegate {
    @IBOutlet weak var dateTextfield:UITextField!
    var didEndEditAction : ((String)->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateTextfield.delegate = self
        dateTextfield.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed), style: PickerStyle.Date)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
    @objc func doneButtonPressed() {
        if let  datePicker = self.dateTextfield.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.dateFormat = "MM-dd-YYYY"
            self.dateTextfield.text = dateFormatter.string(from: datePicker.date)
            didEndEditAction?(self.dateTextfield.text ?? "")

        }
        self.dateTextfield.resignFirstResponder()
     }
}
