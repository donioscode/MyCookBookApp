//
//  RecipeTableViewCell.swift
//  MyCookBookApp
//
//  Created by doniyor normuxammedov on 08/09/24.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RecNumber: UILabel!
    
    @IBOutlet weak var RecDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
