//
//  PokemonTableViewCell.swift
//  JSONTest
//
//  Created by 沈庭鋒 on 2023/4/15.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var pokemonID: UILabel!
    
    @IBOutlet weak var pokemonName: UILabel!
    
    @IBOutlet weak var pokemonType: UILabel!
    
    @IBOutlet weak var pokemonGenera: UILabel!
    
    @IBOutlet weak var pokemonInfo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
