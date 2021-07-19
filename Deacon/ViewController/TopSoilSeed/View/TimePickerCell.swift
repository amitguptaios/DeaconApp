//
//  TimePickerCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class TimePickerCell: UITableViewCell ,UITextFieldDelegate{
    @IBOutlet weak var timeTextfield:UITextField!
    var didEndEditAction : ((String)->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        timeTextfield.delegate = self
        timeTextfield.addInputViewDatePicker(target: self, selector: #selector(doneButtonPressed), style: PickerStyle.Time)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func doneButtonPressed() {
        if let  datePicker = self.timeTextfield.inputView as? UIDatePicker {
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            dateFormatter.dateFormat = "HH:mm"
            self.timeTextfield.text = dateFormatter.string(from: datePicker.date)
            didEndEditAction!(self.timeTextfield.text ?? "")
        }
        self.timeTextfield.resignFirstResponder()
     }
}
