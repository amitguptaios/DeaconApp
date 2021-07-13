//
//  SubmitCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit
protocol NextCellDelegate {
    func didNextButton(_ indexPath: IndexPath)
}
class NextCell: UITableViewCell {
    // MARK: Variable
    var didEndEditAction : (()->())?
    var indexPath = IndexPath()
    var delegateNextCell: NextCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func clickOnNextButton(_ sender:Any){
        print("clickOnNextButton")
        didEndEditAction?()
        delegateNextCell?.didNextButton(indexPath)
    }
    
}
