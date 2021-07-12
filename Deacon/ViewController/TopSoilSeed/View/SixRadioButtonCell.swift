//
//  SixRadioButtonCell.swift
//  Deacon
//
//  Created by ABC on 11/07/21.
//

import UIKit

class SixRadioButtonCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var option1: PVRadioButton!
    @IBOutlet weak var option2: PVRadioButton!
    @IBOutlet weak var option3: PVRadioButton!
    @IBOutlet weak var option4: PVRadioButton!
    @IBOutlet weak var option5: PVRadioButton!
    @IBOutlet weak var option6: PVRadioButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
