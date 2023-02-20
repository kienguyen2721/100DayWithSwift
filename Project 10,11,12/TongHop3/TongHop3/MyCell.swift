//
//  MyCell.swift
//  TongHop3
//
//  Created by Nguyễn Trung Kiên on 28/10/2022.
//

import UIKit

class MyCell: UITableViewCell {

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
