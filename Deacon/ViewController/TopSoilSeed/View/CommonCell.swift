//
//  CommonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class CommonCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var crewLeaderTextfield:UITextField!
    
    // this will be our "call back" closure
    var didEndEditAction : ((String)->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        crewLeaderTextfield.delegate =  self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("Should return")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // call back using a closure
        didEndEditAction?(textField.text ?? "")
        
    }
}
