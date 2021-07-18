//
//  ThreeRadioButtonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class FourRadioButtonCell: UITableViewCell ,RadioButtonGroupDelegate{
    @IBOutlet weak var threeRadioView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var optionA: PVRadioButton!
    @IBOutlet weak var optionB: PVRadioButton!
    @IBOutlet weak var optionC: PVRadioButton!
    @IBOutlet weak var optionD: PVRadioButton!
    var didEndEditAction : ((String)->())?
    var radioButtonGroup: PVRadioButtonGroup!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setConfigRadioButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setTitle(title1:String,title2:String,title3:String,title4:String){
        optionA.buttonTitle = title1
        optionB.buttonTitle = title2
        optionC.buttonTitle = title3
        optionD.buttonTitle = title3
    }
    func setConfigRadioButton() {
        radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.appendToRadioGroup(radioButtons: [optionA,optionB,optionC,optionD])
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
        optionD.radioButtoncolor = UIColor.gray
    }
}

