//
//  AttachmentCell.swift
//  Deacon
//
//  Created by Apple on 09/07/21.
//

import UIKit

class AttachmentCell: UITableViewCell {
    @IBOutlet weak var attachmentImageView:UIImageView!
    @IBOutlet weak var clickButton:UIButton!
    @IBOutlet weak var attachmentTitleLabel:UILabel!
    var didEndEditAction : ((Data,ImageType)->())?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getImageFromImagePicker(VC:UIViewController){
        ImagePickerManager().pickImage(VC){ imageData,imageType  in
            //here is the image
                self.didEndEditAction!(imageData, imageType)
        }
    }
}
