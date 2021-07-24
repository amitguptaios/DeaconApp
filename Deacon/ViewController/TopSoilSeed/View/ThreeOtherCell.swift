//
//  ThreeRadioButtonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class ThreeOtherCell: UITableViewCell,RadioButtonGroupDelegate,UITextFieldDelegate{
    @IBOutlet weak var threeRadioView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var optionA: PVRadioButton!
    @IBOutlet weak var optionB: PVRadioButton!
    @IBOutlet weak var optionC: PVRadioButton!
    @IBOutlet weak var othersTextfield:UITextField!
    var didEndEditAction : ((String)->())?
    var didStartPositionAction : ((String)->())?
    var didTurnsAction : ((String)->())?
    var didPackingsAction : ((String)->())?
    var stringTextField = ""
    var radioButtonGroup: PVRadioButtonGroup!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setConfigRadioButton()
        othersTextfield.delegate =  self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setTitle(title1:String,title2:String,title3:String){
        optionA.buttonTitle = title1
        optionB.buttonTitle = title2
        optionC.buttonTitle = title3
    }
    func setConfigRadioButton() {
        radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.appendToRadioGroup(radioButtons: [optionA,optionB,optionC])
        radioButtonGroup.delegate =  self
    }
    
    func radioButtonClicked(button: PVRadioButton) {
        setRadioButtonColor() 
        didEndEditAction?(button.titleLabel?.text ?? "")
        button.radioButtoncolor = AppColor.appGreenColor
    }
    func setRadioButtonColor()  {
        optionA.radioButtoncolor = UIColor.gray
        optionB.radioButtoncolor = UIColor.gray
        optionC.radioButtoncolor = UIColor.gray
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        let previousText:NSString = textField.text! as NSString
        let updatedText = previousText.replacingCharacters(in: range, with: string)
        if stringTextField == "start_position" {
            didStartPositionAction?(updatedText)
        }else if stringTextField == "turns" {
            didTurnsAction?(updatedText)
        }else if stringTextField == "packing" {
            didPackingsAction?(updatedText)
        } else {
            
        }
        return true
    }
    
}
