//
//  TwoRadioButtonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class TwoRadioButtonCell: UITableViewCell, RadioButtonGroupDelegate {
    @IBOutlet weak var twoRadioView:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var optionA: PVRadioButton!
    @IBOutlet weak var optionB: PVRadioButton!
    var didEndEditAction : ((String)->())?

    var radioButtonGroup: PVRadioButtonGroup!
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
        radioButtonGroup.appendToRadioGroup(radioButtons: [optionA,optionB])
        radioButtonGroup.delegate =  self
    }
    func radioButtonClicked(button: PVRadioButton) {
        didEndEditAction?(button.titleLabel?.text ?? "")
    }
}
