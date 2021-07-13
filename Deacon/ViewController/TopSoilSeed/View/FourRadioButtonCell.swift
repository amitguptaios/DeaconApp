//
//  ThreeRadioButtonCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class FourRadioButtonCell: UITableViewCell {
    @IBOutlet weak var threeRadioView:UIView!
    @IBOutlet weak var option1: PVRadioButton!
    @IBOutlet weak var option2: PVRadioButton!
    @IBOutlet weak var option3: PVRadioButton!
    @IBOutlet weak var option4: PVRadioButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
