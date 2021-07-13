//
//  SubmitCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit
protocol SubmitCellDelegate {
    func didSubmitButton(_ indexPath: IndexPath)
}
class SubmitCell: UITableViewCell {
    
    // MARK: Variable
    var didEndEditAction : (()->())?
    var indexPath = IndexPath()
    var delegateSubmitCell: SubmitCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickOnSubmitButton(_ sender:Any){
        didEndEditAction?()
        print("clickOnSubmitButton")
        delegateSubmitCell?.didSubmitButton(indexPath)
    }
    
}
