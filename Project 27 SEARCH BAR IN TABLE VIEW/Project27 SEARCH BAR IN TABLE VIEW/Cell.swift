//
//  Cell.swift
//  Project27 SEARCH BAR IN TABLE VIEW
//
//  Created by Nguyễn Trung Kiên on 22/11/2022.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
