//
//  JSONTableViewCell.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/18.
//

import UIKit

class JSONTableViewCell: UITableViewCell {

    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieInfo: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
