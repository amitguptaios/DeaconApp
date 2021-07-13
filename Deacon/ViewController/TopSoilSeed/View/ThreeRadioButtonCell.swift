//
//  ThreeRadioButtonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class ThreeRadioButtonCell: UITableViewCell,RadioButtonGroupDelegate{
    @IBOutlet weak var threeRadioView:UIView!
    var didEndEditAction : ((String)->())?
    var radioButtonGroup: PVRadioButtonGroup!
    @IBOutlet weak var optionA: PVRadioButton!
    @IBOutlet weak var optionB: PVRadioButton!
    @IBOutlet weak var optionC: PVRadioButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setRadioButtonTownJob()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setRadioButtonTownJob() {
        radioButtonGroup = PVRadioButtonGroup()
        radioButtonGroup.appendToRadioGroup(radioButtons: [optionA,optionB,optionC])
        radioButtonGroup.delegate =  self
    }
    
    func radioButtonClicked(button: PVRadioButton) {
        didEndEditAction?(button.titleLabel?.text ?? "")
    }
}
