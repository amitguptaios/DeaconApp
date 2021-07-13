//
//  CheckBoxCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class CheckBoxCell: UITableViewCell {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var clickButton:UIButton!
    var didEndEditAction : ((String)->())?
    var flag = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clickOnButton(_ sender:Any){
        if flag{
           flag = false
            didEndEditAction?("NA")
        }else{
           flag = true
        }
    }

}
