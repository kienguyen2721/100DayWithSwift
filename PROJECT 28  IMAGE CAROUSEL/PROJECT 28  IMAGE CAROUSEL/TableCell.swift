//
//  TableCell.swift
//  PROJECT 28  IMAGE CAROUSEL
//
//  Created by Nguyễn Trung Kiên on 22/11/2022.
//

import UIKit

class TableCell: UITableViewCell {

   
    @IBOutlet weak var iconImageView: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
