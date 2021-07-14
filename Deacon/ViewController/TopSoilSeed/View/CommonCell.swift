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
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let previousText:NSString = textField.text! as NSString
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        didEndEditAction?(updatedText)
        
        return true
    }
    
   
}
